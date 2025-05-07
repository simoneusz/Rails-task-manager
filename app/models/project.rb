class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, presence: true

  # If using enum for status
  enum :status, { active: 'active', archived: 'archived', completed: 'completed' }
end
