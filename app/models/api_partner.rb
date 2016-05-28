class ApiPartner < ApplicationRecord
  before_create :ensure_api_key

  validates_uniqueness_of :name, :api_key

  private

  def ensure_api_key
    if api_key.blank?
      api_key = Digest::SHA2.hexdigest("#{SecureRandom.uuid.to_s}").first(30)
    end
  end
end
