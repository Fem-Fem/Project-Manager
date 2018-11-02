class CompanyController < ApplicationController

  def index
    @companies = Company.all
    render 'companies/index'
  end

  def create
    @company = Company.new
    @company.name = params[:name]
    @company.password = params[:password]
    @company.motto = params[:motto]
    @company.location = params[:location]
    @company.save
    redirect to company_path(@company)
  end

  def show
  end

  def edit
  end

  def new
  end

  def delete
  end

  def signup
  end

  def login
  end

  def logout
  end
end
