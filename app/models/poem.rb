class Poem < ApplicationRecord
  has_many :poem_lines
  has_many :lines, through: :poem_lines

  LINE_COUNT = 10

  def self.generate_poem!
    # TODO: Using order => RAND() is not performant. Consider another method.
    lines = Line.where(count: 0).random.first(LINE_COUNT)

    # No longer have unused lines, go and find any you need.
    if lines.count != LINE_COUNT
      additional_lines = Line.random.where.not(id: lines.map(&:id)).first(LINE_COUNT - lines.count)
      lines.push(additional_lines).flatten!
    end

    Poem.create!(lines: lines)
  end
end