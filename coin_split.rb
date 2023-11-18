
class CoinSplit
  #Coin split into denomination
  # n cents by infinite 1,5,10,25 cents
  # You take 1 25, 1 10, 1 5 and then 1s
  # Then take 1 25, 1 10, 2 5 and then 1s
  # Then take 1 25, 2 10s, 1 5 and then 1s
  # 1 25, 2 10s, 2 5s and then ones.
  # So start 25 .. 1 coins. You recurse with increasing lower cost coins till you bubble up.
  #
  #
  def split n
    coins = [25, 10, 5, 1]
    puts splitchange(n,coins,0)
  end

  def splitchange(n, coins, index)
    return 1 if index >= coins.size-1
    ways = 0
    i = 0
    while coins[index]*i <= n
      ways+= splitchange(n-coins[index]*i,coins,index+1)
      i+=1
    end
    ways
  end

  def run
    split 100
    split 20
    split 10
    split 5
  end


end
