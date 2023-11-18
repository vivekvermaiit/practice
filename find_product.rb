require 'pp'
class FindProduct
  #multiply without *
  def self.mult a,b
    a,b =b,a if a > b
    arr=[]#stores times, product
    arr <<  [1,b]

    times = 1
    while times + times <=a
      arr << [times+times,arr.last[1]+arr.last[1]]
      times = times + times
    end

    count = 0
    index = arr.size-1
    product = 0
    while count < a
      if count + arr[index][0] <= a
        count += arr[index][0]
        product += arr[index][1]
      end
      index -= index
    end

    product
  end
end