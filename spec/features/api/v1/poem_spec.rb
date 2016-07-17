require 'rails_helper'

RSpec.describe '/poems', :type => :request do
  let(:partner) { create(:api_partner) }

  describe 'GET /' do
    it 'requires an api partner' do
      create_list(:poem, 10)

      get api_v1_poems_path, no_params, api_header('blah')

      expect(response.status).to eq(401)
      expect(response_json['auth']['message']).to eq('Invalid API key')
    end

    it 'returns an array of poems in order of id desc' do
      create_list(:poem, 10)

      get api_v1_poems_path, no_params, api_header(partner.api_key)

      expect(response_json['poems'].count).to eq(10)
      ids = response_json['poems'].map { |poem| poem['id'] }
      sorted_reversed_ids = ids.sort.reverse

      expect(ids).to eq(sorted_reversed_ids)
    end

    it 'is paginated' do
      create_list(:poem, 30)

      get api_v1_poems_path(:per_page => 10), no_params, api_header(partner.api_key)

      expect(response_json['poems'].count).to eq(10)
      first_id = response_json['poems'].first['id']

      get api_v1_poems_path(:per_page => 10, :page => 2), no_params, api_header(partner.api_key)

      expect(response_json['poems'].first['id']).to eq(first_id - 10)
    end
  end

  describe 'GET /:id' do
    it 'returns a poem' do
      poem = create(:poem)

      get api_v1_poem_path(poem), no_params, api_header(partner.api_key)

      expect(response_json['poem']['id']).to eq(poem.id)
      expect(response_json['poem']['lines'].count).to eq(10)
    end

    it 'returns lines in the order of the poem_lines' do
      poem  = create(:poem)
      lines = poem.poem_lines.order('id asc').map(&:line).compact.map(&:line_text)

      get api_v1_poem_path(poem), no_params, api_header(partner.api_key)

      lines.each_with_index do |line, idx|
        expect(response_json['poem']['lines'][idx]).to eq(line)
      end
    end
  end

  describe 'POST /' do
    it 'creates a poem' do
      expect(Poem).to receive(:generate!).once.and_call_original

      expect(Poem.count).to eq(0)

      post api_v1_poems_path, no_params, api_header(partner.api_key)

      expect(Poem.count).to eq(1)

      poem = Poem.first

      expect(response_json['poem']['id']).to eq(poem.id)
      expect(response_json['poem']['lines'].count).to eq(10)
    end
  end
end
