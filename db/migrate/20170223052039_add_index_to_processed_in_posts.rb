class AddIndexToProcessedInPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts, :processed
  end
end
