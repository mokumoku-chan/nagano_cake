class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def full_customer_name
    last_name + ' ' + first_name
  end


  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active?
  end

end
