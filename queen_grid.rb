class QueenGrid
  #ex 8.13
  # In 8*8 place 8 queens so that none intersect, row or column or diagonal.
  #
  #
  attr_accessor :n

  def initialize
    @n=7
  end

  def giveways
    finishedcolumn=-1
    marks ={}
    giveways2(finishedcolumn,marks)
  end

  def giveways2(finishedcolumn,marks)
    return [marks] if finishedcolumn==@n

    ways =[]
    finishedcolumn+=1
    row = 0
    while row<=@n
      marks = marks.select{|arr| arr[1] < finishedcolumn} #tricky monster line took ages to correct.
      #marks is passed to functions and doesn't change being passed around as reference.
      # in later calls marks is always full so nothing works. Above lines removes extra stuff to find new solutions.
      if can_place? row,finishedcolumn,marks
        marks[[row,finishedcolumn]]=1
        ways += giveways2(finishedcolumn,marks)
      end
      row+=1
    end

    ways
  end

  def can_place?(row, currentcolumn, marks)
    markedthings=marks.keys
    rows = markedthings.collect{|arr| arr[0]}
    columns = markedthings.collect{|arr| arr[1]}
    return false if rows.include? row #check for row
    return false if columns.include? currentcolumn

    x,y=row,currentcolumn
    while x>=0 or y>=0
      return false if marks[[x,y]]==1
      x-=1
      y-=1
    end

    x,y=row,currentcolumn

    while x<=@n or y>=0
      return false if marks[[x,y]]==1
      x+=1
      y-=1
    end

    true
  end

  def run
    giveways
  end
end