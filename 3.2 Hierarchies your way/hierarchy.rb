#Steph Baker
#Hierarchy

class Dessert
    attr_reader :flavour

  def flavour=(flavour)
    if flavour == ""
      raise "Your dessert will taste plain! Choose a flavour!"
    end
    @flavour = flavour
  end
  
  def initialize(flavour = "chocolate")
    @flavour = flavour
  end

  def order
    print "You ordered a #{@flavour} flavoured "
  end
end

class IceCream < Dessert
    attr_reader :scoops

    def scoops=(scoops)
      if scoops < 0
        raise "You can't have #{scoops} scopes!"
      end
      @scoops = scoops
    end

    def initialize(flavour = "chocolate",  scoops = 0)
      super(flavour)
      @scoops = scoops
    end

    def order
      super
      puts "ice cream with #{@scoops} scoops."
    end
end

class Cake < Dessert
    attr_reader :icing

    def icing=(icing)
      if icing == 0
        raise "You can't have no flavour!"
      end
      @icing = icing
    end

    def initialize(flavour = "chocolate",  icing = 0)
      super(flavour)
      @icing = icing
    end

    def order
      super
      puts "cake with #{@icing} icing."
    end
end

class Brownie < Dessert

    
  def print_order
    order
    print "brownie"
    cook
  end

  private

  def cook
    puts " fresh out of the oven!"
  end

end

harry = Brownie.new("fudge")
harry.print_order

fred = Cake.new("chocolate", "strawberry")
fred.order

voldemort = IceCream.new("vanilla", 3)
voldemort.order
