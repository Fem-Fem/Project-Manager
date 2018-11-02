class ProjectController < ApplicationController

  def index
    @projects = Project.all
    render 'projects/index'
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.name = params[:name]
    @project.description = params[:description]
    #
    if @project.valid?
      @project.save
      redirect to project_path(@project)
    else
      render :new
    end
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



  def delete
    @project = Project.find(params[:id]).destroy
    redirect_to projects_path
  end

end
