class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: { impossible: 0, waiting: 1, maiking: 2, finish: 3}
end
