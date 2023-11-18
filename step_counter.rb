class StepCounter
  def count steps
    c = {1=>1,2=>2,3=>4}
    return c[steps] unless c[steps].nil?
    count(steps-1) + count(steps-2) + count(steps-3)
  end

  def countbottomup steps
    c = [1,1,2,4]
    return c[steps] if steps <= 3

    i=4
    while i<=steps
      c[i]=c[i-1]+c[i-2]+c[i-3]
      i+=1
    end

    c[steps]
  end

  def countmemoised steps, c
    return c[steps] unless c[steps].nil?
    c[steps] = countmemoised(steps-1,c) + countmemoised(steps-2,c) + countmemoised(steps-3,c)
    c[steps]
  end

  def countmemo steps
    c = [1,1,2,4]
    countmemoised steps, c
  end
end