class ParenthesisBuilder
  #n left and right paranthesis
  def build n
    total = 2*n
    i=2
    result =[["(",1,0]]

    while i<=total
      new_result = []

      result.each do |arr|
        str = arr[0]
        if can_left? arr, n
          new_result << [str+"(",arr[1]+1,arr[2]]
        end
        if can_right? arr, n
          new_result << [str+")",arr[1],arr[2]+1]
        end
      end

      result = new_result
      i+=1
    end
    result.collect{|arr| arr[0]}
  end

  def can_left?(arr, n)
    arr[1]<n
  end

  def can_right?(arr, n)
    arr[2] < arr[1] && arr[2] <n
  end

  def run
    build(3)
  end
end