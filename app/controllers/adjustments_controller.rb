class AdjustmentsController < ApplicationController
  before_action :find_adjustment, only: [:edit, :update, :destroy]

  def index
    @adjustments = current_company.adjustments
  end

  def new
    @adjustment = Adjustment.new
    @employees = current_company.employees.where(active: true).order(:last_name)
  end

  def create
    if employee_ids_param[:employee_id]
      employee_ids_param[:employee_id].each do |emp_id|
        adj = Adjustment.new(adj_params)
        adj.assign_attributes(employee_id: emp_id)
        if adj.valid?
          adj.save
        else
          @adjustment = Adjustment.new
          @employees = current_company.employees
          flash.now[:alert] = adj.errors.full_messages[0]
          render :new and return
        end
      end
      redirect_to adjustments_path
    # elsif employee_ids_param[:employee_id].length == 1
    #   @adjustment = Adjustment.create(adj_type: params[:adj_type], description: params[:description], adj_amount: params[:adj_amount], employee_id: params[:employee_id])
    #   flash[:message] = "Adjustment created"
    #   redirect_to employee_path(params[:employee_id])
    else
      @adjustment = Adjustment.new
      @employees = current_company.employees
      flash.now[:alert] = "Please enter all information"
      render 'new'
    end
  end

  private

  def adj_params
     params.require(:adjustment).permit(:adj_type, :description, :adj_amount)
  end

  def employee_ids_param
    params.require(:adjustment).permit(employee_id: [])
  end

  def find_adjustment
    @adjustment = Adjustment.find(params[:id])
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
