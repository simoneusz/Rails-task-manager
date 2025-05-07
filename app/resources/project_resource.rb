class ProjectResource < ApplicationResource
  attribute :name, :string
  attribute :description, :string
  attribute :status, :string
  attribute :created_at, :datetime, readable: true
  attribute :updated_at, :datetime, readable: true

  # Associations
  belongs_to :user
  has_many :tasks
  
  # Polymorphic
  has_many :comments, as: :commentable
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
end
