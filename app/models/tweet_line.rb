class TweetLine < ApplicationRecord
  belongs_to :tweet
  belongs_to :line
end
