# == Schema Information
#
# Table name: admin_users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:email)
    end
  end
end
