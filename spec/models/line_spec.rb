require 'rails_helper'

RSpec.describe Line, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:line_text)
      is_expected.to have_db_column(:count)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
    end
  end

end
