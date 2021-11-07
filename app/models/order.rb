class Order < ApplicationRecord
  belongs_to :customer

  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4}
end
