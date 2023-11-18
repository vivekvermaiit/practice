class Car

  #two variables. One has to be passed, other may or may not be.
  # Having make just have attr_reader means it cannot be changed after initialisation
  # to have a default steering
  def initialize(make,type=nil,params={})
    @make = make
    @type = type
    @steering = params[:steering] ||= "front"
    def eco #returning a fixed answer to instance.eco
      'nomy'
    end
  end
  # x=Car.new(:make=>'honda')

  #Variables here attributed as attr_ don't need to be put as @var to be noticed as instance variables.
  attr_accessor :type,:steering
  attr_reader :make

  #constants
  # Car::WHEELS for access
   WHEELS=4

  #class variables- regarded as bad style of coding
  class << self
    attr_accessor :mileage
  end

end

