class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update]

  def new
  end

  def update
    @company.update(company_params)
    redirect_to @company
  end

  def analytics
  end

  private

  def company_params
    params.require(:company).permit(:name, :username, :password)
  end

  def find_company
    @company = Company.find(params[:id])
  end

end
