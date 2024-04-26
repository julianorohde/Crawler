# frozen_string_literal: true

module Napista
  class Search
    def self.call(id:)
      new.call(id)
    end

    def call(locate_id)
      response = agent.post(
        'https://api.napista.com.br/marketplace-portal-bff/search',
        {
          'followUp': '',
          'nlTerms': 'Carro',
          'order': 'RELEVANCE',
          'ps': 48,
          'pn': 1,
          'vehicleType': 'CAR'
        }.to_json,
        'Content-Type' => 'application/json',
        'Contextid' => locate_id
      )

      JSON.parse(response.body)
    end

    private
    
    def agent
      @agent ||= Mechanize.new
    end
  end
end
