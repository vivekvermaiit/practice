class GridStepper

  #matrix =
  def find_path matrix
    r=0
    c=0
    path_hash={} #stores [r,c]=>path
    #to reach r-1,c-1 from 0,0
    path_hash[[matrix.size-2,matrix[0].size-1]] = matrix[matrix.size-2][matrix[0].size-1]==1 ?  []:  [[matrix.size-1,matrix[0].size-1]]
    path_hash[[matrix.size-1,matrix[0].size-2]] = matrix[matrix.size-1][matrix[0].size-2]==1 ? [] : [[matrix.size-1,matrix[0].size-1]] #handles last move base case.

    find matrix,r,c,path_hash
  end

  #path_hash[[r,c]] = nil if not explored. [] if explored and not possible.
  def find matrix,r,c,path_hash
    return path_hash[[r,c]] unless path_hash[[r,c]].nil?

    unless (possible_to_go_right(matrix,r,c) || possible_to_go_down(matrix,r,c)) #deadend
      path_hash[[r,c]] = [[]]
      return path_hash[[r,c]]
    end

    if possible_to_go_right matrix,r,c #r < matrix.size-1 && pomatrix[r+1][c] == 1
      remaining_path_from_right = find(matrix,r,c+1,path_hash)
      if remaining_path_from_right.first.size!=0
        path_hash[[r, c]] = [[r,c+1]] + remaining_path_from_right
        return path_hash[[r,c]]
      end
    end

    if possible_to_go_down matrix,r,c
      remaining_path_from_down = find(matrix,r+1,c,path_hash)
      if remaining_path_from_down.size!=0
        path_hash[[r, c]] = [[r+1,c]] + remaining_path_from_down
        return path_hash[[r,c]]
      end
    end

    #it was possible to go right or down but both those places did not find a solution.
    path_hash[[r,c]] = [[]]
    path_hash[[r,c]]
  end

  def possible_to_go_right(matrix, r, c)
    c < matrix[0].size-1 && matrix[r][c+1]!=1
  end

  def possible_to_go_down(matrix, r, c)
    r < matrix.size-1 && matrix[r+1][c]!=1
  end
end