Customer.transaction do
  (1..10).each do |count|
    Customer.create( :name => "Customer#{count}", :email => "voytas1991@gmail.com" )
  end
end