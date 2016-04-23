class PoemLine < ApplicationRecord
  belongs_to :poem
  belongs_to :line
end