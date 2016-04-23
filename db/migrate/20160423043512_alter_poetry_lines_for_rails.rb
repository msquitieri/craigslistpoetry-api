class AlterPoetryLinesForRails < ActiveRecord::Migration[5.0]
  def change
    rename_column :poetry_lines, :line_id, :id
    rename_column :poetry_lines, :timestamp, :created_at
    add_column :poetry_lines, :updated_at, :datetime
  end
end
