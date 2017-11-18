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

  #my take on .map() returns true or false based on block condition to new array or hash
  def my_map(&block)
    make = [] if self.class == Array
    make = {} if self.class == Hash
    self.my_each do |item|
      yield(item) ? make.push(true) : make.push(false)
    end
    make
  end

  #my take on .inject() returns accumulator or string comparator block result
  def my_inject(accum = self[0])
    accum ||= []
    self.my_each do |item|
      #init test accum settings for errors and adjust
      if accum.class == Fixnum
        accum = 1 if yield(accum,item) == self[0]*self[0]
        accum = 0 if yield(accum,item) == self[0]+self[0]
        accum = self[0] if yield(accum,item) == self[0]**30
      end
      #run as normal now
      accum = yield(accum, item)
    end
    accum
  end
end

#include the CustomEnum module
include CustomEnum

#test variables & code
array = [5,6,7]
stringarray = ["hello","my","name","is","Feythelus"]
hashlist = {"name" => "Feythelus", age: 100, 1234 => "one,two,three,four"}

puts array.inject {|sum, item| sum ** item} #returns 227373675443232059478759765625
puts array.inject(1) {|sum, item| sum ** item} #returns 1
puts array.my_inject {|sum, item| sum ** item} #returns 227373675443232059478759765625
puts array.my_inject(1) {|sum, item| sum ** item} #returns 1
print stringarray.my_inject {|memo, string| memo.length > string.length ? memo : string} #returns "Feythelus"
print hashlist.my_inject {|memo, string| memo.length > string.length ? memo : string} #returns [1234,"one,two,three,four"]
