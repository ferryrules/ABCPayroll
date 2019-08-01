class ApplicationController < ActionController::Base

  helper_method :current_company
  before_action :grab_all
  auto_session_timeout 1.hour
  before_action :authorize

  def current_company
    if session[:company_id]
      Company.find(session[:company_id])
    else
      nil
    end
  end

  def authorize
    redirect_to login_path unless current_company
  end

  private

  def grab_all
    @companies = Company.all
    @employees = Employee.all
    @adjustments = Adjustment.all
    @paychecks = Paycheck.all
    @payrolls = Payroll.all
  end

end
