class RenameAndAddTimestampsToPosts < ActiveRecord::Migration[5.0]
  def up
    rename_column :posts, :timestamp, :created_at
    change_column :posts, :created_at, :date
    add_column :posts, :updated_at, :date, null: false
  end

  def down
    remove_column :posts, :updated_at
    change_column :posts, :created_at, :datetime
    rename_column :posts, :created_at, :timestamp
  end
end
