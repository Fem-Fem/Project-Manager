class ProjectController < ApplicationController

  def index
    @projects = Project.all
    render 'projects/index'
  end

  def create
    @project = Project.new
    @project.name = params[:name]
    @project.description = params[:description]
    @project.save
    redirect to project_path(@project)
  end

  def show
  end

  def edit
  end

  def update
    @project = Project.find(params[:id])
    @project.update(name: params[:name], description: params[:description])
    redirect_to project_path(@project)
  end

  def new
  end

  def delete
    @project = Project.find(params[:id]).destroy
    redirect_to projects_path
  end

end
