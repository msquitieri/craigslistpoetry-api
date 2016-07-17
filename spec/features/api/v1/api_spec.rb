require 'rails_helper'

RSpec.describe '/api/v1', :type => :request do
  let(:partner) { create(:api_partner) }

  describe 'error handling' do
    it 'returns a 500 error message if an error is thrown and it is in production' do
      allow(Rails.env).to receive(:production?).and_return(true)
      allow(Poem).to receive(:generate!).and_raise('Error')

      post api_v1_poems_path, no_params, api_header(partner.api_key)

      expect(response.status).to eq(500)
      expect(response_json['error']['message']).to eq('An unexpected error occurred')
    end
  end
end