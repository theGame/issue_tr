class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :tickets
  has_many :customers, through: :tickets
  has_secure_password
end
