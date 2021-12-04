class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item



  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :production_status, presence: true
  validates :amount, presence: true
  validates :price, presence: true


  enum production_status: { impossible: 0, waiting: 1, maiking: 2, finish: 3}
end
