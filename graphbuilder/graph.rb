class Graph

  attr_accessor :nodes
  #list of nodes

  def initialize(params={})
    @nodes = params[:nodes] ||= {}
  end

end