#Steph Baker
#Studying

require 'byebug'

class Study
    attr_reader :current, :effective 

    def initialize
        @current = current
        @effective = effective
    end

    def take_break
        puts "Take a small break! Listen to your favoutie song!"
    end

    def something_else
        puts "Mix it up, look at a new subject for a second"
    end

    def chores
        puts "Help your family out with the dishes, be productive in a different way."
    end

    def full_study(current, effective)

        while effective < 5
            num = rand(3)+1
            case num
            when 1
                take_break
            when 2
                something_else
            when 3
                chores
            end            
            effective = yield(current, effective)
            current += 1
        end
    
    end

end
 
math = Study.new
math.full_study(1, 0) do |current, effective|
    puts "Let's do math..session #{current}"
    num1 = rand(5)
    num2 = rand(5)
    puts "What is #{num1} + #{num2}:"
    answer = gets.to_i
    if answer == num1+num2
        puts "Good job you got it!"
        effective += 1
    else
        puts "The answer should be #{num1+num2}."
        effective
    end

end


=begin
COLOUR = 
    {
    0 => "red",
    1 => "blue",
    2 => "yellow",
    }
ANSWER = 
{
    "blue + red" => "purple",
    "blue + yellow" => "green",
    "red + blue" => "purple",
    "red + yellow" => "orange",
    "yellow + blue" => "green",
    "yellow + red" => "orange",
    "red + red" => "red",
    "yellow + yellow" => "yellow",
    "blue + blue" => "blue",
    }
art = Study.new
art.full_study(1, 1) do |current, effective|
    puts "Let's do art..session #{current}"
    colour1 = COLOUR[rand(3)]
    colour2 = COLOUR[rand(3)]
    colour = "#{colour1} + #{colour2}"
    puts "What is #{colour}:"
    answer = gets.chomp.downcase
    if answer == ANSWER[colour]
        puts "Good job you got it!"
        effective += 1
    else
        puts "The answer should be #{ANSWER[colour]}."
        effective
    end
    
end
=end
