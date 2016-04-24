class Line < ApplicationRecord
  scope :random, -> { order('RAND()') }
end