class AddIndexOnLineCount < ActiveRecord::Migration[5.0]
  def change
    add_index :lines, :count
  end
end
