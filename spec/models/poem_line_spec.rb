require 'rails_helper'

RSpec.describe PoemLine, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:poem_id)
      is_expected.to have_db_column(:line_id)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
    end

    it 'has its relationships' do
      is_expected.to belong_to(:poem)
      is_expected.to belong_to(:line)
    end
  end

end
