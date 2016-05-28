class RenamePostIdToId < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :post_id, :id
  end
end
