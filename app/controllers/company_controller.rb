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

  post '/companies/index' do
  end

  get '/companies/:id' do
  end

  get '/companies/:id/edit' do
  end

  patch '/companies/:id/edit' do
  end

  delete '/companies/:id/delete' do
  end

  get '/login' do
  end

  post '/login' do
  end

  get '/signup' do
  end

  post '/signup' do
  end

  get '/logout' do
  end

  post '/logout' do
  end
end
