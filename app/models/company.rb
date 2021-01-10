class Company < ApplicationRecord
    belongs_to :list
    has_many :contacts
    
    def self.import(file)
      CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
        company = new
        company.attributes = row.to_hash.slice("name", "area", "tell", "adress")
        company.save!
      end
    end
end