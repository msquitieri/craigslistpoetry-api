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

    it 'has its relationships' do
      is_expected.to belong_to(:post)
    end
  end

  it 'is allowed to have a nil post_id' do
    line = build(:line, post_id: nil)

    expect(line).to be_valid
  end

end
