class AddListIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :list_id, :integer
  end
end
