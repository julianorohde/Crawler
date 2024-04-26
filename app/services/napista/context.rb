# frozen_string_literal: true

module Napista
  class Context
    def self.define(city:, state:)
      new.define(city, state)
    end

    def define(city, state)
      response = agent.post(
        "https://api.napista.com.br/marketplace-portal-bff/me/#{SecureRandom.uuid}/putLocation",
        {
          'geolocation': {},
          'city': city,
          'state': state
        }.to_json,
        'Content-Type' => 'application/json'
        )
      
      JSON.parse(response.body)['id']
    end

    private

    def agent
      @agent ||= Mechanize.new
    end
  end
end
