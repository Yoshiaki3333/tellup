class AddTopResultToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :top_result, :string
  end
end
