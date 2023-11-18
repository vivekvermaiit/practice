load 'graphbuilder/node.rb'
load 'graphbuilder/graph.rb'
require 'pp'
# load 'graph.rb'

#x=BuildGraph.new
#x.build_graph([[:a,:d],[:f,:b],[:b,:d],[:f,:a],[:d,:c]],[:a,:b,:c,:d,:e,:f])
# for building dependencies. d is dependent on a
class BuildGraph
  attr_accessor :built_labels, :graph

  def initialize(params={})
  end

  #builds the graph attribute from the input
  # input = [[]]{:a=>:b,:b=>:c} b is dependent on a, c is dependent on b
  def build_graph(input,projects)
    @graph = Graph.new

    input.each do |arr|
      dependency = arr[0]
      value = arr[1]
      @graph.nodes[dependency] ||= Node.new(dependency)
      @graph.nodes[value] ||= Node.new(value)

      dependency_node = @graph.nodes[dependency]
      value_node = @graph.nodes[value]

      dependency_node.parents << value unless dependency_node.parents.include? value
      value_node.dependents << dependency unless value_node.dependents.include? dependency
    end

    projects.each do |label|
      @graph.nodes[label] ||= Node.new(label)
    end

    pp @graph
  end

  #returns the build order of nodes in the graph
  # Tries building each node if it's possible in the graph. If the size stops decreasing after a round there's problem.
  # leaves graph untouched.
  def build_order
    @built_labels = []
    previous_built_size = -1
    current_built_size =0

    while current_built_size > previous_built_size
      @graph.nodes.each do |label,node|
        @built_labels << label if can_build?(node)
      end
      previous_built_size = current_built_size
      current_built_size = @built_labels.size
    end

    throw Exception if @built_labels.size < @graph.nodes.size
    pp @built_labels
  end

  #builds upward from leaves. build leaves, remove link to parents and then build leaves. #changes the graph.
  def build_order_enhanced
    @built_labels = []

    while true
      nodes = get_nodes_without_descendents
      throw Exception if nodes.size==0 && @built_labels.size < @graph.nodes.size
      remove_link_to_parents(nodes)
      add_to_build_labels(nodes)
      if @built_labels.size == @graph.nodes.size
        pp @built_labels
        return
      end
    end
  end

  def get_nodes_without_descendents
    nodes =[]
    graph.nodes.each do |label,node|
      nodes << node if (node.dependents.size==0 && !@built_labels.include?(node.label))
    end
    nodes
  end

  def remove_link_to_parents(nodes)
    nodes.each do |node|
      node.parents.each do |parent_label|
        parent_node=graph.nodes[parent_label]
        parent_node.dependents.delete(node.label)
      end
    end
  end

  def add_to_build_labels(nodes)
    nodes.each {|node| @built_labels << node.label}
  end

  def can_build?(node)
    return false if built_labels.include? node.label
    node.dependents.each do |label|
      return false unless @built_labels.include? label
    end
    true
  end


  def self.run
    x=BuildGraph.new
    x.build_graph([[:a,:d],[:f,:b],[:b,:d],[:f,:a],[:d,:c]],[:a,:b,:c,:d,:e,:f])
    x.build_order
  end
end