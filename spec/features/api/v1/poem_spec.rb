require 'rails_helper'

RSpec.describe '/poems', :type => :request do
  describe 'GET /:id' do
    it 'returns a poem' do
      poem = create(:poem)

      get api_v1_poem_path(poem), no_params, api_header

      expect(response_json['poem']['id']).to eq(poem.id)
      expect(response_json['poem']['lines'].count).to eq(10)
    end
  end
end
