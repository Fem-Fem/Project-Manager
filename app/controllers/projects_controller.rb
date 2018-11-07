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
    binding.pry
        #
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
