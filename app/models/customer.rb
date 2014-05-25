class Customer < ActiveRecord::Base
  has_many :tickets
  has_many :user, through: :tickets 
end
