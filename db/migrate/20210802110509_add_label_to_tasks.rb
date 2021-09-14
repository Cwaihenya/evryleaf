class AddLabelToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :label, :string
  end
end
