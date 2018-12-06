class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = Project.all
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.html {redirect_to projects_path}
        format.json {render json: @project, status: 201}
      end
    else
      @errors = @project.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @worker = Worker.new
    @projects = Project.all
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @project}
    end
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
