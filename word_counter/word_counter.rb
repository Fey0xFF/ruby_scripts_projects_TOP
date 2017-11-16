#Obtain user string
puts "Please enter a string"
text = gets.chomp

#create array of individual words
words = text.split

#put array of words into hash with key:value pairs
frequencies = Hash.new(0)
words.each { |word| frequencies[word] += 1 }

#sort array by word:count then count
frequencies = frequencies.sort_by { |word, count| count }

#reverse for large->smallest
frequencies.reverse!

#print word count
frequencies.each do |word,count|
  puts word + " " + count.to_s
end
