class Poem < ApplicationRecord
  has_many :poem_lines
  has_many :lines, through: :poem_lines
end