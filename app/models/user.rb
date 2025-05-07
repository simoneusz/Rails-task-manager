# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :destroy
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigned_user_id'
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
