class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_item, dependent: :destroy


  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4}
  enum payment_method: {card: 0, bank: 1}

  def postage
    800
  end

end
