# frozen_string_literal: true

class ApiPlant
  attr_reader :name,
              :perennial,
              :first_harvest,
              :last_harvest,
              :description,
              :sun,
              :image,
              :height,
              :spread,
              :sowing,
              :spacing,
              :slug

  def initialize(info)
    @name = info[:name]
    @perennial = info[:perennial]
    @first_harvest = info[:first_harvest]
    @last_harvest = info[:last_harvest]
    @description = info[:description]
    @sun = info[:sun]
    @image = default_image(info[:image])
    @height = info[:height]
    @spread = info[:spread]
    @sowing = info[:sowing]
    @spacing = info[:spacing]
    @slug = info[:slug]
  end

  def default_image(image)
    if image.nil?
      image = 'https://www.aisd.net/burgin-elementary/wp-content/files/sites/54/2018/08/No-image-available.jpg'
    else
      image
    end
  end
end
