class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status, default: 'pending'
      t.integer :priority, default: 0
      t.datetime :due_date
      t.datetime :completed_at
      t.references :project, null: false, foreign_key: true
      t.references :assigned_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
