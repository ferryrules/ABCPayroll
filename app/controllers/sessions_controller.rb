class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  auto_session_timeout_actions
  skip_before_action :authorize, only: [:index, :new, :create]

  def new
    render 'index'
  end

  def timeout
    render 'timeout'
  end

  def current_user
    current_company
  end

  def create
    company = Company.find_by_username(params[:username])
    if company && company.authenticate(params[:password])
      session[:company_id] = company.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "index"
    end
  end

  def destroy
    session[:company_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
