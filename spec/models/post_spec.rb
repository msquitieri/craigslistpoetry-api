require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:link)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
      is_expected.to have_db_column(:processed)
    end

    it 'has its relationships' do
      is_expected.to have_many(:lines)
    end
  end

  describe 'scopes' do
    describe '.unprocessed' do
      it 'returns all posts where processed is false' do
        create_list(:post, 10, processed: true)
        create_list(:post, 15, processed: false)

        expect(Post.unprocessed.to_a.none?(&:processed?)).to eq(true)
      end
    end
  end

end
