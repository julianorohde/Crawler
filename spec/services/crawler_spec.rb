# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Crawler, type: :service do
  describe '#search_cars' do
    let(:city) { 'Francisco Beltrão' }
    let(:state) { 'PR' }

    context 'when successful search' do
      it 'returns an array of car offers' do
        result = described_class.search_cars(city: city, state: state)

        expect(result).to be_an(Array)
      end

      it 'returns normalized car offers' do
        expect(CrawlerNormalizer).to receive(:normalize)

        result = described_class.search_cars(city: city, state: state)
      end
    end
  end
end
