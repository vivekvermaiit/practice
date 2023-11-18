class Sort

  def mergesort(array)
    n=array.size
    return array if n <=1

    low = 0
    high = n-1
    mid = (low+high)/2

    sorted_left = mergesort(array[low..mid])
    sorted_right = mergesort(array[mid+1..high])
    merge(sorted_left,sorted_right)
  end

  def merge(array1,array2)
    final =[]
    pointer1=0
    pointer2=0

    while pointer1 < array1.size or pointer2 < array2.size
      if pointer1 >= array1.size
        return final + array2[pointer2..array2.size-1]
      end
      if pointer2 >= array2.size
        return final + array1[pointer1..array1.size-1]
      end

      if array1[pointer1] <= array2[pointer2]
        final << array1[pointer1]
        pointer1+=1
      else
        final << array2[pointer2]
        pointer2+=1
      end
    end

    final
  end

  def quicksort(array)
    n=array.size
    return array if n <=1

    pivot = rand(0..n-1)

    smaller=[]
    larger=[]
    comparator = array[pivot]
    array.each_with_index  do |element,i|
      next if i==pivot
      if element <= comparator
        smaller<<element
      else
        larger << element
      end
    end

    quicksort(smaller) + [comparator]+ quicksort(larger)
  end

  def binary_search(element,array)
    n=array.size
    return -1 if n==0
    if n==1
      x = array[0] == element ?  0 :  -1
      return x
    end

    mid = (n-1)/2

    if array[mid]==element
      return mid
    elsif element < array[mid]
      return binary_search(element,array[0..mid])
    else
      return mid+1+binary_search(element,array[mid+1..n-1])
    end
  end
end