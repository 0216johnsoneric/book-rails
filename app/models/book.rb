class Book < ApplicationRecord
    belongs_to :user
    validates :description, :title, presence: true
end
