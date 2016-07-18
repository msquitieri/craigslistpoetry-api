require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
    end

    it 'has its relationships' do
      is_expected.to have_many(:tweet_lines)
      is_expected.to have_many(:lines)
    end
  end

  describe '.tweet_text' do
    it 'returns the text of the tweet' do
      tweet = create(:tweet)

      expect(tweet.tweet_text).to eq(tweet.lines.in_order.pluck(:line_text).join(' / '))
    end

    it 'sanitizes the line text' do
      tweet = create(:tweet)

      tweet.lines.first.update_attribute(:line_text, "    Hello \n\n\n <br>   ")

      expect(tweet.tweet_text).to_not include('<br>')
      expect(tweet.tweet_text).to_not match(/^ /)
      expect(tweet.tweet_text).to_not match(/ $/)
    end
  end

  describe 'self.generate!' do
    it 'creates a new tweet' do
      expect { Tweet.generate! }.to change { Tweet.count }.from(0).to(1)
    end

    it "takes lines in order of it's length" do
      create_list(:line, 15)

      tweet = Tweet.generate!

      in_order_line_text = tweet.lines.in_order.map(&:line_text)
      sorted_by_line_text = tweet.lines.sort_by { |line| line.line_text.length }.map(&:line_text)

      expect(in_order_line_text).to eq(sorted_by_line_text)
    end

    it 'takes lines without count = 0 if none are left' do
      Line.destroy_all

      create_list(:line, 1, count: 0)
      create_list(:line, 10, count: 5)

      lines_with_nonzero_count = Line.where.not(count: 0).to_a

      tweet = Tweet.generate!

      expect((lines_with_nonzero_count & tweet.lines).count).to be > 0
    end
  end

  describe 'self.sanitize_line' do
    it 'returns nil if it is nil' do
      expect(Tweet.sanitize_line(nil)).to be_nil
    end

    it 'removes <br> tags' do
      line = "<br> hello there <br>"

      expect(Tweet.sanitize_line(line)).to eq('hello there')
    end

    it 'removes beginning and trailing whitespace' do
      line = '     this is the greatest     '

      expect(Tweet.sanitize_line(line)).to eq('this is the greatest')
    end

    it 'removes new line characters' do
      line = "\n\n    what do \n\n you think \n\n of this  "

      expect(Tweet.sanitize_line(line)).to eq('what do you think of this')
    end
  end

end
