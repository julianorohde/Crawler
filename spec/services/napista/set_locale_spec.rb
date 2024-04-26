# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Napista::Context, type: :service do
  describe '#define' do
    let(:city) { 'Francisco Beltrão' }
    let(:state) { 'PR' }

    context 'when successful set_locale' do
      it 'call the API with the correct params' do
        locate_id = Napista::Context.define(city: city, state: state)

        expect(locate_id).not_to be_empty
      end
    end
  end
end
