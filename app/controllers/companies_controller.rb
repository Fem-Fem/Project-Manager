class CompaniesController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:signup, :login, :account]

  def account
    render :account
  end

  def index
    @companies = Company.all
  end

  def signup
    render :signup
  end

  def authenticate_signup
    @company = Company.new(name: params[:company][:name], password: params[:company][:password], location: params[:company][:location], motto: params[:company][:motto])
    binding.pry
    if @company.valid?
      @company.save
      redirect_to company_path(@company)
      binding.pry
      session[:name] = params[:company][:name]
    else
      render :index
    end
  end

  def login
    render :login
  end

  def authenticate_login
  end

  def logout
    redirect_to 'sessions/destroy'
    if session[:name]
      session[:name] = nil
    end
    render :account
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :company_id
  end
end
