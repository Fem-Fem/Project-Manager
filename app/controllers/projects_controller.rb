class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
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

end
