#define custom module
module CustomEnum

  #my take on .each()
  def my_each(&block)
    i = 0
    until i == self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index(&block)
    i = 0
    until i == self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

end

#include the CustomEnum module
include CustomEnum

#test variables
array = [5,6,7,8]
stringarray = ["hello","my","name","is","Feythelus"]

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
