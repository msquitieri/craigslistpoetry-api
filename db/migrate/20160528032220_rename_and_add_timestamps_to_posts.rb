class RenameAndAddTimestampsToPosts < ActiveRecord::Migration[5.0]
  def up
    change_column :posts, :timestamp, :datetime
    rename_column :posts, :timestamp, :created_at
    add_column :posts, :updated_at, :datetime, null: false
  end

  def down
    remove_column :posts, :updated_at
    rename_column :posts, :created_at, :timestamp
    change_column :posts, :timestamp, :timestamp
  end
end
