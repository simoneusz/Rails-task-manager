class UserResource < ApplicationResource
  attribute :username, :string
  attribute :email, :string
  attribute :name, :string
  attribute :created_at, :datetime, readable: true
  attribute :updated_at, :datetime, readable: true

  # Associations
  has_many :projects
  has_many :assigned_tasks, resource: TaskResource, foreign_key: :assigned_user_id
  has_many :comments
end
