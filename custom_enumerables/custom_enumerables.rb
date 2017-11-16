#define custom module
module CustomEnum

  #my take on .each()
  def my_each(&block)
    i = 0
    until i > self.length
      yield(self[i])
      i += 1
    end
  end

end

#include the CustomEnum module
include CustomEnum

#test code
array = [5,6,7,8]
#call my_each on array, it works! :)
array.my_each {|item| puts item}
