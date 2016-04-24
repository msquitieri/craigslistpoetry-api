require 'rails_helper'

RSpec.describe Poem, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
    end

    it 'has its relationships' do
      is_expected.to have_many(:poem_lines)
      is_expected.to have_many(:lines)
    end
  end

end
