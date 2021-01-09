class AddListIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :list_id, :integer
  end
end
