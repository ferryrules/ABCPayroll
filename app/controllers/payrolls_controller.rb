class PayrollsController < ApplicationController
  before_action :find_payroll, only: [:show, :submit, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def show
    @payroll = current_company.payrolls.find(params[:id])
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=payroll.xlsx"
      }
      format.html { render :show }
    end
  end

  def submit
    @payroll.update(status: "Submitted")
    # Sends email to user when user is created.
    SubmitMailer.submit_payroll(current_company).deliver
    flash[:message] = "Payroll Submitted!"

    redirect_to payrolls_path
  end

  def new
    @payroll = Payroll.new
    # @payroll.status = "Created"
    @employees = current_company.employees.where(active: true)

    @employees.each do |emp|
      @payroll.paychecks.build(employee: emp)
    end
  end

  def create
    @payroll = Payroll.new(payroll_params)
    if @payroll.valid?
      @payroll.status = "Created"
      @payroll.save
      @payroll.paychecks.each do |paych|
        paych.employee.adjustments.each do |adj|
          PaycheckAdjustment.create(paycheck: paych, adj_type: adj.adj_type, description: adj.description, adj_amount: adj.adj_amount)
        end
      end

      redirect_to @payroll

    else
      @employees = current_company.employees
      flash.now[:alert] = @payroll.errors.full_messages[0]
      render :new
    end

  end


  def edit
  end

  def analytics

  end

  def analytics_show
    @payroll = Payroll.find(params[:id])
    @hourly_paychecks = @payroll.hourly_paychecks
    @salary_paychecks = @payroll.salary_paychecks
    @display_hours = ["Hours","Vacation Hours", "PTO Hours", "Sick Hours", "Holiday Hours"]
    @hour_types = ["hours","vacation_hours", "pto_hours", "sick_hours", "holiday_hours"]

    @hourly_payout_sum = @hourly_paychecks.sum do |paych|
      paych.total_pay_amt
    end

    @salary_payout_sum = @salary_paychecks.sum do |paych|
      paych.total_pay_amt
    end

    @total_payout_sum = @payroll.paychecks.sum do |paych|
      paych.total_pay_amt
    end
  end

  def destroy
    @payroll.destroy
    flash[:message] = "Payroll Deleted"
    redirect_to payrolls_path
  end

  private

  def find_payroll
    @payroll = Payroll.find(params[:id])
  end

  def payroll_params
    params.require(:payroll).permit(:company_id, :start_date, :end_date, :check_date, paychecks_attributes: [:id, :payroll_id, :employee_id, :hours, :vacation_hours, :pto_hours, :sick_hours, :holiday_hours, :ot_hours, :_destroy])
  end

  def authorize
    unless current_company.payrolls.include?(Payroll.find(params[:id]))
      redirect_to payrolls_path
    end
  end
end
