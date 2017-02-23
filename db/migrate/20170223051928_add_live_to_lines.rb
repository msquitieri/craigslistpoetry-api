class AddLiveToLines < ActiveRecord::Migration[5.0]
  def up
    add_column :lines, :live, :boolean, default: false, null: false

    Line.update_all(live: true)

    add_index :lines, :live
  end

  def down
    remove_column :lines, :live
  end
end
