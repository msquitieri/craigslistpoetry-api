require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:email)
    end
  end
end
