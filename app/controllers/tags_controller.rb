class TagsController < ApplicationController
  def index
    tags = TagResource.all(params)
    respond_with(tags)
  end

  def show
    tag = TagResource.find(params)
    respond_with(tag)
  end

  def create
    tag = TagResource.build(params)
    if tag.save
      render jsonapi: tag, status: 201
    else
      render jsonapi_errors: tag
    end
  end

  def update
    tag = TagResource.find(params)
    if tag.update_attributes
      render jsonapi: tag
    else
      render jsonapi_errors: tag
    end
  end

  def destroy
    tag = TagResource.find(params)
    if tag.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: tag
    end
  end
end