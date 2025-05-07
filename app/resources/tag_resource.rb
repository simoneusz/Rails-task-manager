class TagResource < ApplicationResource
  attribute :name, :string
  attribute :created_at, :datetime, readable: true
  attribute :updated_at, :datetime, readable: true

  # Polymorphic through taggings
  has_many :taggings
  many_to_many :projects, through: :taggings, foreign_key: { taggable_id: :id, taggable_type: 'Project' }
  many_to_many :tasks, through: :taggings, foreign_key: { taggable_id: :id, taggable_type: 'Task' }
end
