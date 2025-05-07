class TaskResource < ApplicationResource
  attribute :title, :string
  attribute :description, :string
  attribute :status, :string
  attribute :priority, :integer
  attribute :due_date, :datetime
  attribute :completed_at, :datetime
  attribute :created_at, :datetime, readable: true
  attribute :updated_at, :datetime, readable: true

  # Associations
  belongs_to :project
  belongs_to :assigned_user, resource: UserResource
  
  # Polymorphic
  has_many :comments, as: :commentable
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
end
