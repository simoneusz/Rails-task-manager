FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    status { "MyString" }
    priority { 1 }
    due_date { "2025-05-07 13:40:43" }
    completed_at { "2025-05-07 13:40:43" }
    project { nil }
    assigned_user { nil }
  end
end
