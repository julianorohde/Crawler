# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CrawlerNormalizer, type: :service do
  describe '#normalize' do
    let(:city) { 'Francisco Beltrão' }
    let(:state) { 'PR' }

    before do
      @result = Napista::Search.call(id: Napista::Context.define(city: city, state: state))
    end

    context 'when successful search' do
      it 'normalize the call' do
        normalized = CrawlerNormalizer.normalize(offers: @result)
        
        expect(normalized).to all(include(:modelo, :marca, :ano, :valor, :cidade, :estado, :local_path))
        expect(normalized.first[:cidade]).to match(Regexp.union(city, 'Marmeleiro'))
        expect(normalized.first[:estado]).to match(/PR|Paraná|Parana/)
        expect(normalized.first[:cidade]).not_to include('São Paulo')
        expect(normalized.first[:estado]).not_to match(/SP|São Paulo|Sao Paulo/)
      end
    end
  end
end
