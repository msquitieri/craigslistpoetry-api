# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  link       :string(80)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  processed  :boolean          default(FALSE)
#

class Post < ApplicationRecord
  has_many :lines

  scope :unprocessed, -> { where(processed: false) }
end
