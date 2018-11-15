class WorkersController < ApplicationController
  before_action :require_login

  def index
    @worker = Worker.all
    render 'workers/index'
  end

  def new
    @projects = Project.all
    @worker = Worker.new
  end

  def create
    @worker = Worker.new
    @worker.name = params[:worker][:name]
    @worker.position = params[:worker][:position]
    @worker.rating = params[:worker][:rating]
    if @worker.valid?
      @worker.company = current_company
      @worker.project_id = params[:worker][:project_id].to_i
      @worker.save
      redirect_to workers_path
    else
      @projects = Project.all
      @errors = @worker.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def edit
    @projects = Project.all
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(name: params[:worker][:name], position: params[:worker][:position], rating: params[:worker][:rating])
    if @worker.valid?
      redirect_to workers_path
    else
      @projects = Project.all
      @errors = @worker.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    Worker.find(params[:id]).destroy
    redirect_to workers_path
  end

end
