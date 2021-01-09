class AddContactIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :contact_id, :integer
  end
end
