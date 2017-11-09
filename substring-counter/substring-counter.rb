#initialize dictionary
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#dictionary count function
def dictionary_count(string, dictionary)
  #initialize new hash, and split string into array by word
  counts = Hash.new 0
  arrayedstring = string.scan(/\w+/)

  #check each word in arrayedstring if it is included in the dictionary
  arrayedstring.each do |word|
    #if it is, add to the hash
    if dictionary.include?(word)
      counts[word] += 1
    end
  end
  #display count of each word of the string that is included in the dictionary, by frequency
  puts counts
end

#initialize test string
teststring = "Hello world! below and down I go how the partner sit sit and go"

#call functions to test first by variable, and by undeclared string
dictionary_count(teststring, dictionary)
dictionary_count("below below below down down down go go I I i i low low low",dictionary)
