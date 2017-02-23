# == Schema Information
#
# Table name: tweet_lines
#
#  id         :integer          not null, primary key
#  tweet_id   :integer
#  line_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TweetLine < ApplicationRecord
  belongs_to :tweet
  belongs_to :line
end
