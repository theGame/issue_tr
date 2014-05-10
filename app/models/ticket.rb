class Ticket < ActiveRecord::Base
  
  def generate_current_url res
    len = 3
    upp = 'ABCDEFGHJKLMNPQRSTUVWXYZ'
    number = '1234567890'
    res = ''
    len.times {
      len.times { 
        res << upp[rand(upp.size)] 
      }
      res << '-'
      len.times {
        res << number[rand(number.size)]
      }
      res << '-'
    }
    regular_exp = /^[A-Z]{3}-\d{3}-[A-Z]{3}-\d{3}-[A-Z]{3}/
    res = regular_exp.match(res).to_s
    self.current_url = res
    p " CURRENT_URL ->>> #{self.current_url}"
    p " RES --------->>> #{res}"
  end
end
