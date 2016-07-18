class Poem < ApplicationRecord
  include Lineable

  LINE_COUNT = 10

  has_many :poem_lines, dependent: :delete_all
  has_many :lines, through: :poem_lines do
    # TODO: Not a huge fan of this, but cannot get a
    # default_scope working with the has_many :through.
    def in_order
      order('poem_lines.id asc')
    end
  end

  def self.generate!
    lines = Line.fetch_unused_lines(LINE_COUNT)

    Poem.create!(lines: lines)
  end
end