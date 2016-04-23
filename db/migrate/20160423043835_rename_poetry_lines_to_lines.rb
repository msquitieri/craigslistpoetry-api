class RenamePoetryLinesToLines < ActiveRecord::Migration[5.0]
  def change
    rename_table :poetry_lines, :lines
  end
end
