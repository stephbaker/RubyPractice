#Steph Baker
#Histogram

class Histogram
    attr_reader :text, :sensitive, :special_char, :own_word, :letter, :histogram

    def histogram

        @text.each do |char|
            letter = char.chomp
            @histogram[letter] += 1
        end

        @histogram
    end

    def to_s
        output = ""
        @histogram.each do |letter, count|
            output += "#{letter} #{("*" * count)}\n"
        end
        output
    end

    private

    def initialize(text, sensitive: true, special_char: false, own_word: false, letter: true)

        @text = text
        @sensitive = sensitive
        @special_char = special_char
        @own_word = own_word
        @letter = letter
        @histogram = Hash.new(0)

        if own_word
            print "Word: "
            @text = gets.chomp
        end

        if sensitive
            @text.downcase!
        end

        if special_char
            @text.gsub!(/[.!@%&":;,\-\']/,'')
        end

        if letter
            @text.gsub!(/[ ]/,'')
            @text = @text.chars.sort
            @text = @text.reject {|key| key.include?("\n") }
        else
            @text = @text.delete("\n")
            @text = @text.split(" ").sort
        end
   
    end

end

print "Is your histogram case sensitive? (y/n): "
answer1 = gets.chomp == "n"

print "Does your histogram account for special characters? (y/n): "
answer2 = gets.chomp == "n"

print "Do you want to put in your own word other than 'hello world'? (y/n): "
answer3 = gets.chomp == "y"

print "Would you like your histogram to account for letters or words? (letters/words): "
answer4 = gets.chomp == "letters"


text = "HELLO World!"
counter = Histogram.new(text, sensitive: answer1, special_char: answer2, own_word: answer3, letter: answer4, )
puts counter.histogram
puts counter
