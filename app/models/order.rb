class Order < ApplicationRecord
  belongs_to :customer

  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4}
  enum payment_method: {card: 0, bank: 1}

end
