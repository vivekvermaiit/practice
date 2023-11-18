class RodCutting

  #pi = [] Prices of the rod of size n.
  # pi[0]=0 convention
  # Find rn : Max price of a rod of length n after cutting.
  #rn = max(p_i + r_n-i)
  #

  def self.find_revenue_brute_force(pi,n)
    return 0 if n==0
    max=-1
    (1..n).each do |i|
      max = [max,pi[i]+find_revenue_brute_force(pi,n-i)].max
    end
    max
  end

  def self.find_revenue_memoized(pi,n)
    r=[0,pi[1]]
    find_revenue_memoized_rec(pi,n,r)
    r[n]
  end

  def self.find_revenue_memoized_rec(pi,n,r)
    return r[n] if r[n]
    max=-1
    (1..n).each do |i|
      max = [max,pi[i]+find_revenue_memoized_rec(pi,n-i,r)].max
    end
    r[n]=max
  end

  def self.find_revenue_iterative(pi,n)
    r=[0,pi[1]]

    (2..n).each do |i|
      max=-1
      (1..i).each do |j|
        max=[max,pi[j]+r[i-j]].max
      end
      r[i] = max
    end
    r[n]
  end
end

pi=[0,1,5,8,9,10]
puts RodCutting.find_revenue_brute_force(pi,5)
puts RodCutting.find_revenue_memoized(pi,5)
puts RodCutting.find_revenue_iterative(pi,5)