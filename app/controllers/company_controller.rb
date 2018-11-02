class CompanyController < ApplicationController

  def index
    @companies = Company.all
    render 'companies/index'
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
