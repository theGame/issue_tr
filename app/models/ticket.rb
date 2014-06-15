class Ticket < ActiveRecord::Base
  validates :customer_id, :status, :current_url, :title, presence: true
  validates :status, inclusion: { in: %w(Accept Pending Cancel),
    message: "%{value} is not valid" }
  validates :current_url, format: { with: /[A-Z]{3}-\d{3}-[A-Z]{3}-\d{3}-[A-Z]{3}/,
    message: "invalid url"  }  
  validates :customer_id, numericality: { only_integer: true }
  validates :title, length: { in: 2..40 }
  validates :user_id, format: { with: /\d*/,
    message: "invalid user_id" }
  
  belongs_to :customer
  belongs_to :user
  
  def generate_current_url res
    length = 3
    uppercase = 'ABCDEFGHJKLMNPQRSTUVWXYZ'
    number = '1234567890'
    res = ''
    length.times {
      length.times { 
        res << uppercase[rand(uppercase.size)] 
      }
      res << '-'
      length.times {
        res << number[rand(number.size)]
      }
      res << '-'
    }
    regular_exp = /^[A-Z]{3}-\d{3}-[A-Z]{3}-\d{3}-[A-Z]{3}/
    res = regular_exp.match(res).to_s
    self.current_url = res
  end
end
