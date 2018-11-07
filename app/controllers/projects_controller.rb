class ProjectsController < ApplicationController
  before_action :require_login

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
    @project = Project.find(params[:id])
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

  private

  def require_login
    return head(:forbidden) unless session.include? :company_id
  end

end
