require 'rails_helper'

RSpec.describe '/poems', :type => :request do
  describe 'GET /' do
    it 'returns an array of poems in order of id desc' do
      create_list(:poem, 10)

      get api_v1_poems_path, no_params, api_header

      expect(response_json['poems'].count).to eq(10)
      ids = response_json['poems'].map { |poem| poem['id'] }
      sorted_reversed_ids = ids.sort.reverse

      expect(ids).to eq(sorted_reversed_ids)
    end

    it 'is paginated' do
      create_list(:poem, 30)

      get api_v1_poems_path(:per_page => 10), no_params, api_header

      expect(response_json['poems'].count).to eq(10)
      first_id = response_json['poems'].first['id']

      get api_v1_poems_path(:per_page => 10, :page => 2), no_params, api_header

      expect(response_json['poems'].first['id']).to eq(first_id - 10)
    end
  end


  describe 'GET /:id' do
    it 'returns a poem' do
      poem = create(:poem)

      get api_v1_poem_path(poem), no_params, api_header

      expect(response_json['poem']['id']).to eq(poem.id)
      expect(response_json['poem']['lines'].count).to eq(10)
    end
  end
end
