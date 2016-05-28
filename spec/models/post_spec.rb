require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:post_id)
      is_expected.to have_db_column(:link)
      is_expected.to have_db_column(:timestamp)
    end

    it 'has its relationships' do
      is_expected.to have_many(:lines)
    end
  end

end
