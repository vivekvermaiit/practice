class Vehicle

  attr_accessor :wheels, :mileage

  def initialize
    puts "type Vehicle"
  end

  def get_area
    raise NoMethodError("Override this implementation")
  end

  def do
    model.segments.filter(&:eligible).each
  end
end