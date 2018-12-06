class CompaniesController < ApplicationController
  before_action :require_login
  before_action :already_logged_in, only: [:signup]
  skip_before_action :require_login, only: [:require_login, :signup, :authenticate_signup, :index]

  def index
    @companies = Company.all
  end

  def signup
    render :signup
  end

  def authenticate_signup
    @company = Company.new(name: params[:company][:name], password: params[:company][:password], location: params[:company][:location], motto: params[:company][:motto])
    if @company.valid?
      @company.save
      session[:name] = params[:company][:name]
      redirect_to company_path(@company)
    else
      @errors = @company.errors.full_messages.to_sentence
      render :signup
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html {render: show}
      format.json {render json: @company}
    end
  end

  def reports
    @company = Company.all
  end

end
