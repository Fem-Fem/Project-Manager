class ProjectController < ApplicationController

  def index
    @projects = Project.all
    render 'projects/index'
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
