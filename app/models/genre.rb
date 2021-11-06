class Genre < ApplicationRecord
  validates :name, presence: true

   has_many :item, dependent: :destroy
end
