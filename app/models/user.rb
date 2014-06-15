class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 4 },
    length: { maximum: 20 }
  
  has_many :tickets
  has_many :customers, through: :tickets
  has_secure_password
end
