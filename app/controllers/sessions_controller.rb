class SessionsController < ApplicationController
  def new
  end

  def create
    # if auth
    #   @company = Company.new
    #   @company.name = auth["info"]["raw_info"]["company"]
    #   @company.location = auth["extra"]["raw_info"]["location"]
    #   change motto to bio?
    #   @company.bio = auth["extra"]["raw_info"]["bio"]

    #   binding.pry
    #   if @company.valid?
    #     @company.save
    #     session[:name] = params[:company][:name]
    #     redirect_to company_path(@company)
    #   else
    #     @errors = @company.errors.full_messages.to_sentence
    #     render :'/companies/signup'
    #   end
    # end
    @company = Company.find_by(name: params[:company][:name])
    if @company && @company.authenticate(params[:company][:password])
      session[:name] = params[:company][:name]
      redirect_to company_path(@company)
    else
      @errors = "Invalid combination!"
      render :'/companies/login'
    end
  end

  def destroy
    if session[:name]
      session[:name] = nil
    end
    redirect_to(controller: 'companies', action: 'account')
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

end
