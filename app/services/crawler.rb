# frozen_string_literal: true

require 'mechanize'

class Crawler  
  def self.search_cars(city:, state:)
    new.search_cars(city, state)
  end

  def search_cars(city, state)
    locate_id = Napista::Context.define(city: city, state: state)

    result = Napista::Search.call(id: locate_id)

    CrawlerNormalizer.normalize(offers: result)
  end

  private

  attr_accessor :city, :state
end
