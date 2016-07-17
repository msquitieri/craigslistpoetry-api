class Poem < ApplicationRecord
  LINE_COUNT = 10

  has_many :poem_lines, dependent: :delete_all
  has_many :lines, through: :poem_lines do
    # TODO: Not a huge fan of this, but cannot get a
    # default_scope working with the has_many :through.
    def in_order
      order('poem_lines.id asc')
    end
  end

  after_create :increment_line_count

  def self.generate_poem!
    # TODO: Using order => RAND() is not performant. Consider another method.
    lines = Line.unused.random.first(LINE_COUNT)

    # No longer have unused lines, go and find any you need.
    if lines.count != LINE_COUNT
      additional_lines = Line.random.where.not(id: lines.map(&:id)).first(LINE_COUNT - lines.count)
      lines.push(additional_lines).flatten!
    end

    Poem.create!(lines: lines)
  end

  private

  def increment_line_count
    self.lines.update_all('count = count + 1')
  end

end