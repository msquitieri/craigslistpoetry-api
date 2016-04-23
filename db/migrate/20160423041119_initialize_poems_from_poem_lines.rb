class InitializePoemsFromPoemLines < ActiveRecord::Migration[5.0]
  def up
    PoemLine.uniq.pluck(:poem_id).count.times do
      poem = Poem.create!
      poem_line = PoemLine.select('created_at').where(poem_id: poem.id).first

      if poem_line.created_at.present?
        poem.update_attribute(:created_at, poem_line.created_at)
      end
    end
  end

  def down
    ActiveRecord::Base.connection.execute('TRUNCATE poems')
  end
end
