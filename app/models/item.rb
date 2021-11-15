class Item < ApplicationRecord

 belongs_to :genre
 has_many :cart_item, dependent: :destroy
 attachment :image

 enum is_active: { sale: true, stop_selling: false}

 validates :genre_id, presence: true
 validates :name, presence: true
 validates :introduction, presence: true
 validates :price, presence: true
 validates :is_active, presence: true



end
