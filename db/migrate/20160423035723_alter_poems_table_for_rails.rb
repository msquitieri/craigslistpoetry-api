class AlterPoemsTableForRails < ActiveRecord::Migration[5.0]
  def change
    add_column :poems, :id, :primary_key
    rename_column :poems, :timestamp, :created_at
    add_column :poems, :updated_at, :datetime
  end
end
