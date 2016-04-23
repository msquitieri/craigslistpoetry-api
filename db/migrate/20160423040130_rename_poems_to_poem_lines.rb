class RenamePoemsToPoemLines < ActiveRecord::Migration[5.0]
  def change
    rename_table :poems, :poem_lines
  end
end
