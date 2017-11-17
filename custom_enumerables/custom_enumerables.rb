#define custom module
module CustomEnum

  #my take on .each()
  def my_each(&block)
    for item in self
      yield(item)
    end
    self
  end

  #my take on .each_with_index()
  def my_each_with_index(&block)
    i = 0
    for item in self
      yield(item, i)
      i += 1
    end
    self
  end

  #my take on .select() using .my_each() from above
  def my_select(&block)
    make = [] if self.class == Array
    make = {} if self.class == Hash
    self.my_each do |item|
      make.push(item) if yield(item) == true
    end
    make
  end

  #my take on .all?() using .my_each() from above and ternary
  def my_all?(&block)
    i = 0
    self.my_each do |item|
      i += 1 if yield(item) == true
    end
    i == self.length ? true : false
  end

  #my take on .any?() using .my_each() from above and ternary, similar to my_all?()
  def my_any?(&block)
    i = 0
    self.my_each do |item|
      i += 1 if yield(item) == true
    end
    i > 1 ? true : false
  end

end

#include the CustomEnum module
include CustomEnum

#test variables & code
array = [5,6,7,8]
stringarray = ["hello","my","name","is","Feythelus"]
hashlist = {"name" => "Feythelus", age: 100, 1234 => "one,two,three,four"}

array.my_any? {|item| item > 1} #returns true
array.my_any? {|item| item > 100} #returns false

#array.my_each_with_index {|item, index| print "#{item}, #{index}     "}
#hashlist.my_each_with_index {|key, val, index| print "#{key}, #{val}, #{index}   "}

#hashlist.each_with_index {|key, val, index| print "#{key}, #{val}, #{index}   "}
#array.each_with_index {|item, index| print "#{item},#{index}    "}


=begin
#my enum for .each()
array.my_each {|item| puts item}
#Ruby's built in enum
array.each {|item| puts item}
=end

=begin
#my enum for .each_with_index()
stringarray.my_each_with_index {|item, index| puts "#{item}, #{index}"}
#Ruby's built in enum
stringarray.each_with_index {|item, index| puts "#{item}, #{index}"}
