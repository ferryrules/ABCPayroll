class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def index
    @employees = current_company.employees.order('active DESC, last_name')
  end

  def new
    @employee = Employee.new
    @company = current_company
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
      flash[:message] = "Employee Created"
      redirect_to "/employees/#{@employee.id}/edit"
    else
      flash.now[:alert] = "#{@employee.errors.full_messages[0]}"
      render 'new'
    end
  end

  def update
    # byebug
    if @employee.update(employee_params)
      flash[:message] = "#{@employee.full_name} Updated"
      redirect_to employees_path
    else
      flash.now[:alert] = "#{@employee.errors.full_messages[0]}"
      render 'edit'
    end
  end


  def new_adjustment
    if params[:employee_id]
      adj = Adjustment.new(employee_id: params[:employee_id])
      adj.save(validate: false)
      redirect_to edit_employee_path(params[:employee_id])
    else
      flash[:alert] = "Please create the employee first"
      redirect_to new_employee_path
    end
  end

  def destroy_adjustment
    adj = Adjustment.find(params[:id])
    employee = adj.employee
    adj.delete
    redirect_to edit_employee_path(employee)
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :pay_rate, :pay_type, :active, :company_id, :filing_status, :allowances, adjustments_attributes: [:id, :adj_type, :description, :adj_amount, :employee_id, :_destroy])
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def authorize
    unless current_company.employees.include?(Employee.find(params[:id]))
      redirect_to employees_path
    end
  end
end
