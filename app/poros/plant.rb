class Plant

  attr_reader :name, :perennial, :first_harvest, :last_harvest, :description, :sun, :image, :height, :spread, :sowing, :spacing

  def initialize(info) 
    @name = info[:name]
    @perennial = info[:perennial]
    @first_harvest = info[:first_harvest]
    @last_harvest = info[:last_harvest]
    @description = info[:description]
    @sun = info[:sun]
    @image = info[:image]
    @height = info[:height]
    @spread = info[:spread]
    @sowing = info[:sowing]
    @spacing = info[:spacing]
  end 
  
end
