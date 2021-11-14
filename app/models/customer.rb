class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :is_active, inclusion: {in: [true, false]}

  enum is_active: { admission: true, withdrawal: false}

  has_many :order, dependent: :destroy


end
