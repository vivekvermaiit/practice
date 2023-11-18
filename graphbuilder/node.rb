class Node

  attr_accessor :label, :dependents, :parents

  def initialize(label,params={})
    @label=label
    @dependents = params[:dependents] ||= []
    @parents = params[:parents] ||= []
  end
end