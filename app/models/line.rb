class Line < ApplicationRecord
  belongs_to :post, optional: true

  scope :random, -> { order('RAND()') }
  scope :unused, -> { where(count: 0) }
end