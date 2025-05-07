class CommentResource < ApplicationResource
  attribute :body, :string
  attribute :created_at, :datetime, readable: true
  attribute :updated_at, :datetime, readable: true

  # Associations
  belongs_to :user
  
  # Polymorphic
  polymorphic_belongs_to :commentable do
    group_by(:commentable_type) do
      on(:Project)
      on(:Task)
    end
  end
end
