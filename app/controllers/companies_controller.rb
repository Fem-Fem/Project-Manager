class CompaniesController < ApplicationController
  before_action :require_login
  before_action :already_logged_in, only: [:signup, :login, :account]
  skip_before_action :require_login, only: [:require_login, :signup, :login, :account]

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
    binding.pry
    @company = Company.new(name: params[:company][:name], password: params[:company][:password], location: params[:company][:location], motto: params[:company][:motto])
    if @company.valid?
      @company.save
      session[:name] = params[:company][:name]
      redirect_to company_path(@company)
    else
      render :index
    end
  end

  def login
    render :login
  end

  def show
    @company = Company.find(params[:id])
  end

end
