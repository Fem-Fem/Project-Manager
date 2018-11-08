class ProjectsController < ApplicationController
  # before_action :require_login

  def index
    @projects = Project.all
  end

  def new
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    worker = Worker.find_by(name: params[:project][:worker])
    binding.pry
    if worker
      if worker.project_id != nil
        render :new
      else
        @project.workers << params[:project][:worker]
      end
    else
      # need error here. how to add worker error here?
    end

    if @project.valid?
      @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(name: params[:project][:name], description: params[:project][:description])
    redirect_to projects_path
  end

  def delete
    @project = Project.find(params[:id])
    render :destroy
  end

  def destroy
    @project = Project.find(params[:id]).destroy
    redirect_to projects_path
  end

  def most_popular
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :company_id
  end

end
