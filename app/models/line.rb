class Line < ApplicationRecord
  belongs_to :post, optional: true

  scope :random, -> { order('RAND()') }
end