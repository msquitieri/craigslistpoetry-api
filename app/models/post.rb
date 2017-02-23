class Post < ApplicationRecord
  has_many :lines

  scope :unprocessed, -> { where(processed: false) }
end