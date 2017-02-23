# == Schema Information
#
# Table name: poem_lines
#
#  poem_id    :integer
#  line_id    :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  updated_at :datetime
#

class PoemLine < ApplicationRecord
  belongs_to :poem
  belongs_to :line
end
