class Tweet < ApplicationRecord
  include Lineable

  TWEET_LENGTH = 135
  TWEET_LINE_SEPARATOR = "\n"
  FETCH_LINES_COUNT = 10

  has_many :tweet_lines, dependent: :delete_all
  has_many :lines, through: :tweet_lines do
    # TODO: Not a huge fan of this, but cannot get a
    # default_scope working with the has_many :through.
    def in_order
      order('tweet_lines.id asc')
    end
  end

  def send!
    raise 'Cannot send a tweet that already has a twitter_id' if self.twitter_id.present?

    response = Tweeter.instance.tweet(tweet_text)
    update_attribute(:twitter_id, response.id)
  end

  def self.generate!
    lines = Line.fetch_unused_lines(FETCH_LINES_COUNT)
    lines = compile_tweet(lines)

    Tweet.create!(lines: lines)
  end

  def tweet_text
    self.lines.in_order.map { |line| Tweet.sanitize_line(line.line_text) }.join(TWEET_LINE_SEPARATOR)
  end

  private

  def self.compile_tweet(lines)
    lines.sort_by! { |line| line.line_text.length }

    tweet_text = ''
    tweet_lines = lines.map do |line|
      prospective_tweet = "#{tweet_text}#{TWEET_LINE_SEPARATOR}#{sanitize_line(line.line_text)}"

      if prospective_tweet.length < TWEET_LENGTH
        tweet_text = prospective_tweet

        line
      end

    end.compact

    tweet_lines
  end

  def self.sanitize_line(line)
    return nil if line.nil?

    line = line.gsub('<br>', ' ')
    line = line.gsub("\n", ' ')
    line = line.gsub(/  */, ' ')
    line = line.gsub(/^ /, '')
    line = line.gsub(/ $/, '')

    line
  end
end
