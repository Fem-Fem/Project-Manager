class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      @company = Company.find_or_create_by_omniauth(auth)
      session[:name] = @company.name
      binding.pry
      redirect_to company_path(@company)
    else
    #   redirect_to company_path(@company)
    #   @company = Company.new
    #   @company.name = auth["info"]["raw_info"]["company"]
    #   @company.location = auth["extra"]["raw_info"]["location"]
    #   change motto to bio?
    #   @company.bio = auth["extra"]["raw_info"]["bio"]

    #   binding.pry
    #   else
    #     @errors = "Did not log into github correctly"
    #     render :'account'
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
