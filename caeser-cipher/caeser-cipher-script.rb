puts "Enter string to encrypt:"
text = gets.chomp!
puts "Enter shift factor:"
shiftfactor = gets.chomp!.to_i

def cypher(string, shift)
  #initialize letter arrays
  letters = ('a'..'z').to_a
  cap_letters = ('A'..'Z').to_a

  #scan through string to shift char
  string.scan(/./) do |n|
    if letters.include? n
      index = letters.index(n)
      index -= shift
      print letters[index]
    elsif cap_letters.include? n
      index = cap_letters.index(n)
      index -= shift
      print cap_letters[index]
    else
      print n
    end
  end
end

#call cypher
cypher(text, shiftfactor)
