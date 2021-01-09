class AddPersonToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :person, :string
  end
end
