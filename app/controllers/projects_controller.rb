# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    projects = ProjectResource.all(params)
    respond_with(projects)
  end

  def show
    project = ProjectResource.find(params)
    respond_with(project)
  end

  def create
    project = ProjectResource.build(params)

    if project.save
      render jsonapi: project, status: :created
    else
      render jsonapi_errors: project
    end
  end

  def update
    project = ProjectResource.find(params)

    if project.update_attributes
      render jsonapi: project
    else
      render jsonapi_errors: project
    end
  end

  def destroy
    project = ProjectResource.find(params)

    if project.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: project
    end
  end
end
