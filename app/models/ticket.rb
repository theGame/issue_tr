class Ticket < ActiveRecord::Base
  validates :customer_id, presence: true
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
