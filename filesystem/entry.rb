class Entry
  attr_accessor :name, :created_at, :modified_at, :parent

  def initialize(name,created_at,modified_at)
    @name=name
    @created_at=created_at
    @modified_at=modified_at
  end
end