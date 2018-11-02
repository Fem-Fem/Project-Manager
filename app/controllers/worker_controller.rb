class WorkerController < ApplicationController

  def index
    @worker = Worker.all
    render 'workers/index'
  end

  def show
  end

  def edit
  end

  def new
  end

  def delete
  end

end
