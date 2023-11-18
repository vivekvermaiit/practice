class StringPermutations
  def permute s
    return [] if s.nil?
    return [s] if s.size==1
    weave(s[0],permute(s[1..-1]))
  end

  def weave(char, strarr)
    result =[]
    strarr.each do |str|
      (0..str.size).each do |i|
        if i==0
          result << char + str
        else
          result << str[0..i-1] + char + str[i..-1]
        end
      end
    end
    result
  end

  def run
    permute ""
  end

end