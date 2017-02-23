class AddProcessedToPosts < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :processed, :boolean, default: false

    Post.update_all(processed: true)
  end

  def down
    remove_column :posts, :processed
  end
end
