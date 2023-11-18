class Files < Entry
  attr_accessor :content

  def initialize(name,created_at,modified_at)
    @content=""
    super(name,created_at,modified_at)
  end

  def size
    1
  end
end