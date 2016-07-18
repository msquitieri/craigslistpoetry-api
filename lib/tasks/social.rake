namespace :social do

  desc 'Tweet out an excerpt of a poem'
  task tweet: :environment do
    puts 'Sending out a tweet...'

    tweet = Tweet.generate!
    tweet.send!

    puts "Tweet ##{tweet.id} sent out. See http://twitter.com/craigslistpoems/status/#{tweet.twitter_id}"
  end

end
