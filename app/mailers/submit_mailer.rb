class SubmitMailer < ApplicationMailer
  default from: "ABC Payroll"

  def submit_payroll(current_company)
    @company = current_company
    mail(to: "ferris@abcsolutionsfl.com", subject: "#{@company.name} has submitted payroll")
  end

end
