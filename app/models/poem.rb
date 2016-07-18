class Poem < ApplicationRecord
  include Lineable

  has_many :poem_lines, dependent: :delete_all
  has_many :lines, through: :poem_lines do
    # TODO: Not a huge fan of this, but cannot get a
    # default_scope working with the has_many :through.
    def in_order
      order('poem_lines.id asc')
    end
  end

  def self.generate!
    lines = fetch_unused_lines

    Poem.create!(lines: lines)
  end
end