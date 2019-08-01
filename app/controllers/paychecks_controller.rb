class PaychecksController < ApplicationController
  before_action :find_paycheck, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def update
    # @paycheck.assign_attributes(paycheck_params)
    if @paycheck.update(paycheck_params)
      flash[:message] = "Paycheck for #{@paycheck.employee.first_last} successfully edited"
      redirect_to @paycheck.payroll
    else
      flash.now[:alert] = @paycheck.errors.full_messages[0]
      render :edit
      # redirect_to edit_paycheck_path(@paycheck)
    end
  end

  def new_adjustment
    pay_adj = PaycheckAdjustment.new(paycheck_id: params[:paycheck_id])
    pay_adj.save(validate: false)
    flash[:alert] = "Changes to hours were not saved"
    redirect_to edit_paycheck_path(params[:paycheck_id])
  end

  def destroy_adjustment
    adj = PaycheckAdjustment.find(params[:id])
    paycheck = adj.paycheck
    adj.delete

    redirect_to edit_paycheck_path(paycheck)
  end

  private

  def find_paycheck
    @paycheck = Paycheck.find(params[:id])
  end

  def paycheck_params
    params.require(:paycheck).permit(:payroll_id, :employee_id, :hours, :vacation_hours, :pto_hours, :sick_hours, :holiday_hours, :ot_hours, paycheck_adjustments_attributes: [:id, :paycheck_id, :adj_type, :description, :adj_amount, :_destroy])
  end

  def authorize
    unless current_company.paychecks.include?(Paycheck.find(params[:id]))
      redirect_to payrolls_path
    end
  end
end
