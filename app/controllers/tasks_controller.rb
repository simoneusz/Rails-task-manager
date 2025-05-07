class TasksController < ApplicationController
  def index
    tasks = TaskResource.all(params)
    respond_with(tasks)
  end

  def show
    task = TaskResource.find(params)
    respond_with(task)
  end

  def create
    task = TaskResource.build(params)
    if task.save
      render jsonapi: task, status: 201
    else
      render jsonapi_errors: task
    end
  end

  def update
    task = TaskResource.find(params)
    if task.update_attributes
      render jsonapi: task
    else
      render jsonapi_errors: task
    end
  end

  def destroy
    task = TaskResource.find(params)
    if task.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: task
    end
  end

  # Custom action to mark a task as complete
  def complete
    task = Task.find(params[:id])
    if task.complete!
      render jsonapi: TaskResource.new(task)
    else
      render jsonapi_errors: task
    end
  end
end