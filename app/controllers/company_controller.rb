class CompanyController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:signup, :login, :account]

  def index
    @companies = Company.all
    render 'companies/index'
  end

  def signup
    @company = Company.new
    @company.name = params[:name]
    @company.password = params[:password]
    @company.motto = params[:motto]
    @company.location = params[:location]
    #
    if @company.valid?
      @company.save
      redirect to company_path(@company)
    else
      render :new
    end
  end

  def login

  end

  def show
  end

  def logout
  end
end
