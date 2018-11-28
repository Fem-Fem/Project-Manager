class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      @errors = @project.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    # render :json @project.to_json
    #need to change to serializer
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

end
