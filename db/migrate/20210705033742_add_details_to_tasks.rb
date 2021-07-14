class AddDetailsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :content, :string
    add_column :tasks, :status, :string
    add_column :tasks, :priority, :integer
    add_column :tasks, :deadline, :date
  end
end
