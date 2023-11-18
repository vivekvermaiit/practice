require 'pp'
class TowerHanoi
  #move 1 to n blocks from a to c via b
  # a, b, c are three stacks
  # hash stores {'a'=>a,'b'=>b,'c'=>c} from printing.
  # TowerHanoi.new.move(1,a,[],[],{'a'=>a,'b'=>[],'c'=>[]})
  attr_accessor :step_counter

  def initialize
    @step_counter=0
  end

  def move(n, a, b, c,hash)
    if n==1
      makemove(a,c)
      print(hash)
      return
    end
    move(n-1,a,c,b,hash)
    makemove(a,c)
    print(hash)
    move(n-1,b,a,c,hash)
  end

  #moves top element of a to b.
  def makemove(a,b)
    b.push a.pop
    @step_counter += 1
  end

  def print(hash)
    puts 'a= ' + hash['a'].to_s + ' b= ' + hash['b'].to_s + ' c= ' + hash['c'].to_s
  end

  def run
    puts 'Enter n'
    n = gets.chomp.to_i
    a = (1..n).to_a.reverse
    b = []
    c = []
    hash = { 'a' => a,'b'=>b,'c'=>c}
    print(hash)
    move(a.size,a,b,c,hash)
    puts @step_counter
  end

end