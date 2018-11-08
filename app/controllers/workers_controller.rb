class WorkersController < ApplicationController
  # before_action :require_login

  def index
    @worker = Worker.all
    render 'workers/index'
  end

  def new
  end

  def create
    @worker = Worker.new
    @worker.name = params[:worker][:name]
    @worker.position = params[:worker][:position]
    if @worker.valid?
      @worker.save
      redirect_to workers_path
    else
      render :new
    end
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(name: params[:worker][:name], position: params[:worker][:position])
    redirect_to workers_path
  end

  def delete
    Worker.find(params[:id]).destroy
    redirect_to workers_path
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :company_id
  end

end
