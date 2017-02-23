# == Schema Information
#
# Table name: api_partners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  api_key    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ApiPartner, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:name)
      is_expected.to have_db_column(:api_key)
    end

    it 'has its validations' do
      is_expected.to validate_uniqueness_of(:name)
      is_expected.to validate_uniqueness_of(:api_key)
    end
  end

  describe 'api_key' do
    it 'always sets one before saving' do
      partner = build(:api_partner, api_key: nil)

      expect(partner.api_key).to be_blank
      partner.save!
      expect(partner.api_key).to be_present
    end
  end
end

