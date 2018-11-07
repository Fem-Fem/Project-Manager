class WorkersController < ApplicationController
  # before_action :require_login

  def index
    @worker = Worker.all
    render 'workers/index'
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new
    @worker.name = params[:name]
    @worker.position = params[:position]
    if @worker.valid?
      @worker.save
      redirect to worker_path(@worker)
    else
      render :new
    end
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def edit
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(name: params[:name], position: params[:position])
    redirect_to worker_path(@worker)
  end

  def delete
    @worker = Worker.find(params[:id]).destroy
    redirect_to workers_path
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :company_id
  end

end
