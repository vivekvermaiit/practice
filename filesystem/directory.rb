class Directory < Entry
  attr_accessor :contents

  def initialize(name,created_at,modified_at)
    @contents=[]
    super(name,created_at,modified_at)
  end

  def size
    return 1 if @contents.size==0 #empty directory size 1
    result=0
    @contents.each do |entry|
      result+=entry.size
    end
    result
  end


end