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

class ApiPartner < ApplicationRecord
  before_create :ensure_api_key

  validates_uniqueness_of :name, :api_key

  private

  def ensure_api_key
    if api_key.blank?
      self.api_key = Digest::SHA2.hexdigest("#{SecureRandom.uuid.to_s}").first(30)
    end
  end
end
