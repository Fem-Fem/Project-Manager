class WorkerController < ApplicationController

  def index
    @worker = Worker.all
    render 'workers/index'
  end

  def new
  end

  def create
    @worker = Worker.new
    @worker.name = params[:name]
    @worker.position = params[:position]
    @worker.save
    redirect to worker_path(@worker)
  end

  def show
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

end
