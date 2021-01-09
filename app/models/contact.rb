class Contact < ApplicationRecord
    belongs_to :company
    belongs_to :list
    belongs_to :user
end
