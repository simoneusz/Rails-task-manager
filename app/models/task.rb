# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_user, class_name: 'User', optional: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true

  # If using enum for status
  enum :status, { pending: 'pending', in_progress: 'in_progress', completed: 'completed' }
  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }

  # Scope for overdue tasks
  scope :overdue, -> { where('due_date < ? AND completed_at IS NULL', Time.current) }

  # Mark task as completed
  def complete!
    update(status: 'completed', completed_at: Time.current)
  end
end
