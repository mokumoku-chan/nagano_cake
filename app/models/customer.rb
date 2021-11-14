class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :is_active, inclusion: {in: [true, false]}

  enum is_active: { admission: 1, withdrawal: 0}

  has_many :order, dependent: :destroy
  has_many :address, dependent: :destroy
  has_many :cart_item, dependent: :destroy


end
