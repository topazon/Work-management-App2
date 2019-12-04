class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :task_title
      t.date :created_on
      t.datetime :started_at
      t.datetime :finished_at
      t.text :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
