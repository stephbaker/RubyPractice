#Steph baker
#On a silver platter

class Fruit

    def to_s
        "Eat all the fruit!"
    end

end

class Apple < Fruit

    def eat
        "Chomp down"
    end

    def to_s
        "#{eat} on an apple."
    end 

end

class Banana < Fruit

    def eat
        "Peel and bite"
    end
    
    def to_s
        "#{eat} a banana."
    end

end

class Cheese

    def eat
        "Cut, place on cracker, and munch"
    end
    
    def to_s
        "#{eat} some cheese."
    end

end

class Sausage

    def eat
        "Cut and chew"
    end
    
    def to_s
        "#{eat} a sausage."
    end

end

fruit = Fruit.new
apple = Apple.new
banana = Banana.new
cheese = Cheese.new
sausage = Sausage.new

silver_platter = [fruit, apple, banana, cheese, sausage]

# silver_platter.each { |food| puts food if food.is_a?(Fruit) }
# silver_platter.each { |food| puts food }

silver_platter.each { |food| puts food.eat if food.respond_to?(:eat) }
