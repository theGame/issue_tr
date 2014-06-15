class Customer < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,
    massege: "invalid e-mail addess", multiline: true }, 
    uniqueness: true
  validates :name, length: { in: 6..20 }
  
  has_many :tickets
  has_many :user, through: :tickets 
end
