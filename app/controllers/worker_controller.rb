class WorkerController < ApplicationController

  def index
    @worker = Worker.all
    render 'workers/index'
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
  end

  def new
  end

  def delete
  end

end
