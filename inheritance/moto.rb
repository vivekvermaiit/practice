class Moto < Vehicle
  def initialize
    @wheels = 2
    puts "initialised Moto"
    super
  end

  def get_area
    puts "just a test method"
  end
end