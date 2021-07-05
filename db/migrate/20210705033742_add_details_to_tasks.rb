class AddDetailsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :title, :string, null: false
    add_column :tasks, :content, :string, null: false
    add_column :tasks, :status, :string, null: false
    add_column :tasks, :priority, :string, null: false
    add_column :tasks, :deadline, :date, null: false
  end
end
