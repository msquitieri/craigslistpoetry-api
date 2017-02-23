require 'rails_helper'

RSpec.describe Line, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:line_text)
      is_expected.to have_db_column(:count)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
      is_expected.to have_db_column(:live)
    end

    it 'has its relationships' do
      is_expected.to belong_to(:post)
    end
  end

  describe 'scopes' do
    describe '.unused' do
      it 'returns lines with a count of 0' do
        create_list(:line, 10, count: 0)
        create_list(:line, 15, count: 15)

        expect(Line.unused.to_a.all? { |line| line.count.zero? }).to eq(true)
      end
    end

    describe '.live' do
      it 'returns lines that are live' do
        create_list(:line, 10, live: true)
        create_list(:line, 15, live: false)

        expect(Line.live.to_a.all?(&:live?)).to eq(true)
      end
    end
  end

  it 'is allowed to have a nil post_id' do
    line = build(:line, post_id: nil)

    expect(line).to be_valid
  end

end
