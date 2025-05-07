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
      render jsonapi: project, status: 201
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
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: project
    end
  end

  # Custom action for project statistics
  def stats
    project = Project.find(params[:id])
    stats = {
      total_tasks: project.tasks.count,
      completed_tasks: project.tasks.where(status: 'completed').count,
      overdue_tasks: project.tasks.overdue.count,
      tasks_by_priority: {
        low: project.tasks.where(priority: 0).count,
        medium: project.tasks.where(priority: 1).count,
        high: project.tasks.where(priority: 2).count,
        urgent: project.tasks.where(priority: 3).count
      }
    }
    render json: { data: { id: project.id, type: 'project-stats', attributes: stats } }
  end
end