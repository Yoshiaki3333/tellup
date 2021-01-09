class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :result
      t.text :detail
      t.timestamps
    end
  end
end
