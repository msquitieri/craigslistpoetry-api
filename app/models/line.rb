class Line < ApplicationRecord
  belongs_to :post

  scope :random, -> { order('RAND()') }
end