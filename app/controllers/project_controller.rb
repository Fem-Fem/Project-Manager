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

  def new
  end

  def delete
  end

end
