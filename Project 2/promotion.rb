#Steph Baker
#Promotion 
require 'byebug'
require 'date'

class OrderReader
  attr_reader :file_name

  def read(file)

    #declare variables
    order_number = 0
    date = nil
    address_house = nil
    address_city = nil
    quantity = 0
    price = 0
    name = nil
    id = 0
    products = []

    #read file and separate out the important information
    File.open(file) do |review_file|
      review_file.each_line.with_index do |line, line_number|

      case line_number
      #order line
      when 0
        if line.include? "#"
          order_number = line.split('#')[1].strip.to_i
        else
          oops_method(1)
        end

      #date line
      when 1
        date_hash = Date._parse(line)
        if Date.valid_date?(date_hash[:year].to_i, date_hash[:mon].to_i, date_hash[:mday].to_i)
          date = line
        else
          oops_method(2)
        end

      #street address
      when 2
        if line.count("0-9") > 0
          address_house = line
        else
          oops_method(3)
        end

      #city line
      when 3
        if line.include? ","
          address_city = line
        else
          oops_method(4)
        end

      #all other order lines with products
      else
        #checks to see all lines have the right amount of tabs
        if line.split("\t").length < 5
          oops_method(line_number + 1)
        end

        line.split("\t").each_with_index do |value, placement|
        case placement
        #quantity
        when 0
          if value.to_i > 0
            quantity = value.to_i
          else
            oops_method(line_number + 1)
          end

        #nothing to retieve, just validation
        when 1
          unless value == "x"
            oops_method(line_number + 1)
          end

        #price
        when 2
          if value.include? "$"
            price = Float(value[1..-1])
          else
            oops_method(line_number + 1)
          end

        #name of purchasing object
        when 3
          name = value

        #product id
        when 4
          if (value.include? "(") && (value.include? ")") 
            id = value[1...-1].to_i
          else
            oops_method(line_number + 1)
          end
        end        
      end

      #create products objects
      products << Product.new(quantity, price, name, id)
      end
    end

    #create order object
    Order.new(order_number, date, address_house, address_city, products)
  end
end

  #creates an error sign that something went wrong in order
  def oops_method(error_line)
    puts "There is an error in line #{error_line} of your order file."
    exit
  end

end

class Product
  attr_reader :quantity, :price, :name, :id

  def initialize(quantity, price, name, id)
    self.quantity = quantity
    self.price = price
    self.name = name
    self.id = id
  end

  def to_s
    "#{@quantity}\tx\t$#{sprintf('%.2f', @price)}\t#{@name}\t(#{@id})"
  end

  #making sure each product can't be editted after they are retieved
  private

  def quantity=(quantity)
    @quantity = quantity
  end

  def price=(price)
    @price = price
  end

  def name=(name)
    @name = name
  end

  def id=(id)
    @id = id
  end

end

class Order
  attr_reader :order_number, :date, :address_house, :address_city, :products

 def initialize(order_number, date, address_house, address_city, products)
   self.order_number = order_number
   self.date = date
   self.address_house = address_house
   self.address_city = address_city
   self.products = products
 end

 def to_s
   output = "Order ##{order_number}\n#{date}#{address_house}#{address_city}"
   output += products.join("\n")
  #  output = output + "\n"
  #  output = output + item_count.join("\n")
  #  output = output + "\n\nTotal: #{total}\n\n"
  #  output = output + item_total.join("\n")
   output
 end

 #total of all the product prices
  def total
    products.map.sum { |p| p.quantity * p.price }
  end

  #total of each item
  def item_count

   item_count = products.map{ |p| p.name }.uniq
   items_counted = []
   i = 0

   while i < item_count.length
     relevant_lines = products.find_all { |p| p.name.include?(item_count[i]) }
     amounts = relevant_lines.map.sum {|p| p.quantity }
     items_counted <<  "#{item_count[i]}: #{amounts}"
     i += 1
   end

   items_counted

 end

 #total price of each item
 def item_total

   item_total = products.map{ |p| p.name }.uniq
   items_totalled = []
   i = 0

   while i < item_total.length
     relevant_lines = products.find_all { |p| p.name.include?(item_total[i]) }
     amounts = relevant_lines.map.sum { |p| p.quantity * p.price }
     items_totalled <<  "#{item_total[i]}: $#{amounts}"
     i += 1
   end

   items_totalled

 end

 #raising error if something is wrong in the code
 def oops_method(error_line)
   puts "There is an error with line #{error_line}."
   exit
 end

 #making sure order are is not editable
 private

 def order_number=(order_number)
   @order_number = order_number
   unless @order_number > 0
     oops_method(1)
   end
 end

 def date=(date)
   @date = date
 end
 
 def address_house=(address_house)
   @address_house = address_house
   if @address_house == ""
     oops_method(3)
   end
 end

 def address_city=(address_city)
   @address_city = address_city
 end

 def products=(products)
   @products = products
 end

end

class Promotion

  #gets start and end date for promotions that need date (2 and 4)
  def valid?(order)
    print "Start date (YYYY-MM-DD): "
    start_date = gets.chomp.split('-')
    start_date = Date.new(start_date[0].to_i, start_date[1].to_i, start_date[2].to_i)
 
    print "End date (YYYY-MM-DD): "
    end_date = gets.chomp.split('-')
    end_date = Date.new(end_date[0].to_i, end_date[1].to_i, end_date[2].to_i)

    date = order.date.split('-')
    date = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)

    if (start_date < date && end_date > date)
        valid = order
    else
        puts "Discount: $0.00"
        puts "After discount: $#{order.total}"
        exit
    end

  end

end

class Percentage < Promotion

  def discount(order)
    print "Percentage (e.g. 5%): "
    answer = gets.chomp[0...-1].to_f
    percent = (answer/100.00).round(2)
    puts "Discount: $#{sprintf('%.2f', order.total * percent)}"
    puts "Order price after discount: $#{sprintf('%.2f', (order.total - (order.total * percent)))}"
  end

end

class LimitedTimePercentage < Percentage

  def discount(order)
    super(valid?(order))
  end

end

class DollarDiscount < Promotion

  def discount(order)
    print "Amount to take off (e.g. $3.00): "
    dollar_value = gets.chomp[1..-1].to_f

    if order.total>50
      puts "Discount: $#{sprintf('%.2f', dollar_value)}"
      puts "Order price after discount: $#{sprintf('%.2f', (order.total - dollar_value))}"
    else
      puts "Discount: $0.00"
      puts "Order price after discount: $#{order.total}"
    end
  end

end

class LimitedTimeDollarDiscount < DollarDiscount

  def discount(order)
    super(valid?(order))
  end

end

class CityPercentDiscount < Promotion

  def discount(order)
    print "Enter the city you would like to add a discount to (e.g. Ottawa): "
    city = gets.chomp 
    answer = order.address_city.split(',')[0]   
    if answer == city
      puts "Discount: $10.00"
      puts "Order price after discount: $#{sprintf('%.2f',(order.total - 10))}"
    else
      puts "Discount: $0.00"
      puts "Order price after discount: $#{order.total}"
    end
  end
end

file = ""
until File.exists?(file)
  print "Enter your the order filename: "
  file = gets.chomp 
end

order_reader = OrderReader.new
order1 = order_reader.read(file)
puts order1

puts "1: Percentage discount"
puts "2: Limited time percentage discount"
puts "3: Dollar discount"
puts "4: Limited time dollar discount"
puts "5: Location discount"

promotion_option = 0
until promotion_option.between?(1,5)
  print "Select a promotion to apply: "
  promotion_option = Integer(gets) rescue 0
end

case promotion_option
when 1
  promotion = Percentage.new
when 2
  promotion = LimitedTimePercentage.new
when 3
  promotion = DollarDiscount.new
when 4
  promotion = LimitedTimeDollarDiscount.new
when 5
  promotion = CityPercentDiscount.new
end

promotion.discount(order1)
