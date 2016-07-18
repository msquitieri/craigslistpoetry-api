class CreateTweetLines < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet_lines do |t|
      t.integer :tweet_id
      t.integer :line_id

      t.timestamps
    end
  end
end
