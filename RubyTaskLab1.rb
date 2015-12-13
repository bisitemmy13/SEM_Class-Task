# Name: Olabisi Ipinlaye
# Course: Software Methodology
# Date: 05/12/2015
# Assignment: task1.rb  
# Lecturer: Saleh Hadi (PhD)

# define Customer class 
class Customer
  attr_accessor :first_name, :last_name
  
  def initialize(first_name, last_name)   
    @first_name = first_name  
    @last_name = last_name  
  end

  # accessor methods
  def set_fstname(first_name)
    @first_name = first_name
  end
   
  def get_fstname()
    @first_name
  end

  def set_lstname(last_name)
    @last_name = last_name
  end
   
  def get_lstname()
    @last_name
  end
end

# define Store class
class Store
  @@orderArray = Array.new()

  def register_order(customer, sum)
    @@orderArray.push(Order.new(customer, sum))
  end

  def orders_for(customer)
    @total_sum = 0
    
    @@orderArray.each do |order|
      if customer.get_fstname == order.get_customer.get_fstname && customer.get_lstname == order.get_customer.get_lstname then
        @total_sum = @total_sum + order.get_sum
      end
    end

    print "For ", customer.get_fstname, " ", customer.get_lstname, " the total_sum : ", @total_sum , "\n"
  end  
  
  def orders_summary()
    print "\nAll of the orders: \n"

    @@orderArray.each do |order|
      print order.display()
    end  
  end  
end

# define Order class
class Order
  attr_accessor :customer, :sum

  def initialize(customer, sum)   
    @customer = customer  
    @sum = sum  
  end

  def get_customer()
    @customer
  end

  def get_sum()
    @sum
  end

  def display()
    print "Order created! Customer : ", @customer.get_fstname, " ",  @customer.get_lstname, ". ", "Sum of this order : ", @sum, "\n"
  end
end

# main
if __FILE__ == $0
  store = Store.new

  customer_fst = Customer.new('Jonathan', 'Khan')

  order1 = Order.new(customer_fst, 2500)

  store.register_order(customer_fst, 2000)
  store.register_order(customer_fst, 1750)

  customer_sec = Customer.new('Abdul', 'wahab')

  store.register_order(customer_sec, 500)

  store.orders_for(customer_fst)
  store.orders_for(customer_sec)
  store.orders_summary
end