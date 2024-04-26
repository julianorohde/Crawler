# frozen_string_literal: true

class CrawlerNormalizer
  def self.normalize(offers:)
    new.normalize(offers)
  end

  def normalize(offers)
    offers_list = []

    offers['offers'].each do |offer|
      vehicle = offer['versionName'].split(' ', 2)
      photo = offer['photos']&.first

      offers_list << {
        modelo: vehicle.second,
        marca: vehicle.first,
        ano: offer['modelYear'],
        valor: offer['price'],
        cidade: offer['location']['city'],
        estado: offer['location']['state'],
        local_path: photo ? photo['url'] : ''
      }
    end
  
    offers_list
  end
end
