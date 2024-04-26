# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Napista::Context, type: :service do
  describe '#define' do
    let(:city) { 'Francisco Beltrão' }
    let(:state) { 'PR' }

    before do
      @locate_id = Napista::Context.define(city: city, state: state)
    end

    context 'when successful search' do
      it 'call the API with the correct params' do
        result = Napista::Search.call(id: @locate_id)

        expect(result).not_to be_empty
      end
    end
  end
end
