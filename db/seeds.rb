# Clear existing data
puts "Clearing existing data..."
Comment.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all
Tag.destroy_all if defined?(Tag)
Tagging.destroy_all if defined?(Tagging)

users = []

# Create Users
puts "Creating users..."

9.times do
  users << User.create!(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    name: Faker::Name.name,
    password_digest: BCrypt::Password.create('password')
  )
end

# Create Projects
puts "Creating projects..."
projects = []
users.each do |user|
  rand(1..3).times do
    projects << Project.create!(
      name: Faker::App.name,
      description: Faker::Lorem.paragraph,
      status: %w[active completed archived].sample,
      user: user
    )
  end
end

# Create Tasks
puts "Creating tasks..."
tasks = []
projects.each do |project|
  rand(3..8).times do
    due_date = Faker::Date.between(from: Date.today, to: 30.days.from_now)
    completed = Faker::Boolean.boolean(true_ratio: 0.3)
    completed_at = completed ? Faker::Date.between(from: 10.days.ago, to: Date.today) : nil

    tasks << Task.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph,
      status: completed ? 'completed' : %w[pending in_progress].sample,
      priority: [0, 1, 2, 3].sample,
      due_date: due_date,
      completed_at: completed_at,
      project: project,
      assigned_user: users.sample
    )
  end
end

# Create Comments
puts "Creating comments..."
comments = []
tasks.each do |task|
  rand(0..5).times do
    comments << Comment.create!(
      body: Faker::Lorem.paragraph,
      commentable: task,
      user: [task.assigned_user, task.project.user, users.sample].compact.sample
    )
  end
end

# Add some comments to projects too
projects.each do |project|
  rand(0..3).times do
    comments << Comment.create!(
      body: Faker::Lorem.paragraph,
      commentable: project,
      user: [project.user, users.sample].sample
    )
  end
end

# Create Tags (Optional)
if defined?(Tag) && defined?(Tagging)
  puts "Creating tags..."
  tags = []
  %w[urgent bug feature enhancement documentation design frontend backend api database].each do |tag_name|
    tags << Tag.create!(name: tag_name)
  end

  # Add tags to tasks
  tasks.each do |task|
    rand(0..3).times do
      Tagging.create!(
        tag: tags.sample,
        taggable: task
      )
    end
  end

  # Add tags to projects
  projects.each do |project|
    rand(0..2).times do
      Tagging.create!(
        tag: tags.sample,
        taggable: project
      )
    end
  end
end

puts "Seed data created successfully!"
puts "Created #{User.count} users"
puts "Created #{Project.count} projects"
puts "Created #{Task.count} tasks"
puts "Created #{Comment.count} comments"
puts "Created #{Tag.count} tags" if defined?(Tag)
puts "Created #{Tagging.count} taggings" if defined?(Tagging)