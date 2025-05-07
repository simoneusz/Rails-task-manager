class TaggingResource < ApplicationResource
  attribute :created_at, :datetime, readable: true
  attribute :updated_at, :datetime, readable: true

  # Associations
  belongs_to :tag
  
  # Polymorphic
  polymorphic_belongs_to :taggable do
    group_by(:taggable_type) do
      on(:Project)
      on(:Task)
    end
  end
end