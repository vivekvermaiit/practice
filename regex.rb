# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)

  regex_i=0
  string_i=0
  p=format(p)

  while regex_i <= p.size-1 and string_i <= s.size-1 do
    if p[regex_i]=='.'
      regex_i+=1
      string_i+=1
    elsif p[regex_i] == "*"
      char = p[regex_i-1]
      if char=='.'
        if regex_i==p.size-1
          return true
        else
          return false
        end
      end
      #match with char as much as possible.

      (string_i..s.size).each do |idx|
        if s[idx] and char==s[idx]
          next
        else
          regex_i+=1
          string_i=idx
          break
        end
      end

    else #normal characters
      if p[regex_i+1] and p[regex_i+1]=='*'
        regex_i+=1
        next
      end
      if p[regex_i]==s[string_i]
        regex_i+=1
        string_i+=1
      else
        return false
      end
    end
  end

  if regex_i < p.size
    while regex_i < p.size do
      if p[regex_i+1]=='*'
        regex_i+=2
      else
        break
      end
    end
  end

  if regex_i == p.size and string_i == s.size
    return true
  else
    return false


  end


end

def format(p) # s*s = ss*
  #find a star and next = before, swap star with last occurence.

  i=1
  n=p.size
  return p if n==1 or n==2

  while i<=n-2 do
    if p[i]=='*'

      #skip all the double stars
      x=i #x is the index of last double star.
      while x<n do
        if p[x+2]=='*'
          x+=2
        else
          break
        end
      end

      (x+1..n).each do |idx| #move the entire matching part before the * at i
        if p[idx] and p[idx]==p[i-1]
          next
        else
          #insert from x+1 to idx-1 before i
          total = idx-x-1
          if total>0
            move=p.slice!(x+1..idx-1)
            p.insert(i,move)
            i+=total
          end
          break
        end
      end


      end
      i+=1

  end
  p
end



puts is_match("aaca","ab*a*c*a")