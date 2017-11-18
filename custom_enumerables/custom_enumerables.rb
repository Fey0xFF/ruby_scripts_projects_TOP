#define custom module
module CustomEnum

  #my take on .each() returns index based on block based on block condition
  def my_each(&block)
    for item in self
      yield(item)
    end
    self
  end

  #my take on .each_with_index() returns index with index # based on block condition
  def my_each_with_index(&block)
    i = 0
    for item in self
      yield(item, i)
      i += 1
    end
    self
  end

  #my take on .select() applys block condition to an array or hash and returns a new respective class
  def my_select(&block)
    make = [] if self.class == Array
    make = {} if self.class == Hash
    self.my_each do |item|
      make.push(item) if yield(item) == true
    end
    make
  end

  #my take on .all?() returns true if all items meet block condition
  def my_all?(&block)
    i = 0
    self.my_each do |item|
      i += 1 if yield(item) == true
    end
    i == self.length ? true : false
  end

  #my take on .any?() returns true if one or more items meet block condition, otherwise false
  def my_any?(&block)
    i = 0
    self.my_each do |item|
      i += 1 if yield(item) == true
    end
    i > 1 ? true : false
  end

  #my take on .none?() returns false if one or more items meet block condition
  def my_none?(&block)
    i = 0
    self.my_each do |item|
      i += 1 if yield(item) == true
    end
    i > 1 ? false : true
  end


  #my take on .count() returns number of times block condition is met, otherwise returns count of items in array or hash
  def my_count(&block)
    return self.length if block_given? == false
    i = 0
    self.my_each do |item|
      i += 1 if yield(item) == true
    end
    return i
  end

end

#include the CustomEnum module
include CustomEnum

#test variables & code
array = [5,6,7,8]
stringarray = ["hello","my","name","is","Feythelus"]
hashlist = {"name" => "Feythelus", age: 100, 1234 => "one,two,three,four"}

array.my_count
hashlist.my_count
#print array.my_count {|item| item > 6} #returns false
#print array.my_count {|item| item > 100} #returns true

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
=end
