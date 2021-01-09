class AddProjectNameToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :project_name, :string
  end
end
