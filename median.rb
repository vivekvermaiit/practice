# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  rank = (nums1.size + nums2.size)/2 #find the number bigger than these many numbers.

  if nums2.size > nums1.size #nums1 is bigger in the end.
    nums1,nums2=nums2,nums1
  end

  return median(nums1,nums2,0,nums1.size-1,0,nums2.size-1,rank)
end

#midpoint of num1 and then compare with 
def median(num1, num2, start1, end1, start2, end2,rank)
  if rank==0
    first = num1[start1]
    second = num2[start2]
    first ||= Float::INFINITY
    second ||= Float::INFINITY
    element1mid= [first,second].min

    if (num1.size + num2.size)%2 == 1
      return element1mid
    else
      idx1 = find_index(num1,element1mid,start1,num1.size-1)
      idx2 = find_index(num2,element1mid,start2,num2.size-1)
      lesserelement1 =  idx1 > 0 ? num1[idx1-1] : -Float::INFINITY
      lesserelement2 = idx2 >0 ? num2[idx2-1] : -Float::INFINITY
      lesserelement = [lesserelement1,lesserelement2].max
      if idx1==0 and idx2==0
        lesserelement = num1[idx1]
      end
      return (element1mid+lesserelement)/2.0
    end
  end

  mid1 = (start1+end1)/2
  element1mid = num1[mid1]

  index2 = find_index(num2,element1mid,start2,end2)

  element1biggerthan = (mid1-start1) + (index2-start2)

  #what if index2 is the end.

  if element1biggerthan <= 0
    rank= rank-1
    start1=start1+1
    return end1-start1>= end2-start2 ? median(num1, num2, start1, end1, start2, end2,rank) : median(num2, num1, start2, end2, start1, end1,rank)
  end

  if rank > element1biggerthan
    rank = rank - element1biggerthan
    return end1-mid1 >= end2-index2 ? median(num1, num2, mid1, end1, index2, end2, rank) : median(num2, num1, index2,end2, mid1, end1, rank)

  elsif rank < element1biggerthan
    return mid1-start1 >= index2-start2 ? median(num1, num2, start1, mid1, start2, index2, rank) :  median(num2, num1, start2, index2, start1, mid1, rank)

  else # found
    #check if correct size or not.
    if (num1.size + num2.size)%2 == 1
      return element1mid
    else
      idx1 = find_index(num1,element1mid,start1,num1.size-1)
      idx2 = find_index(num2,element1mid,start2,num2.size-1)
      lesserelement1 =  idx1 > 0 ? num1[idx1-1] : -Float::INFINITY
      lesserelement2 = idx2 >0 ? num2[idx2-1] : -Float::INFINITY
      lesserelement = [lesserelement1,lesserelement2].max
      return (element1mid+lesserelement)/2.0
    end

  end

end


def find_index(array, element,start1,end1)
  index = array.bsearch_index{|x| x>=element}
  index ||= array.size
  index=start1 if index<start1
  index
end


find_median_sorted_arrays([3,3,3,3],[3,3,3,3])