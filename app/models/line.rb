class Line < ApplicationRecord
  belongs_to :post, optional: true

  scope :random, -> { order('RAND()') }
  scope :unused, -> { where(count: 0) }
  scope :live, -> { where(live: true) }

  def self.fetch_unused_lines(count)
    # TODO: Using order => RAND() is not performant. Consider another method.
    lines = Line.live.unused.random.first(count)

    # No longer have unused lines, go and find any you need.
    if lines.count != count
      additional_lines = Line.random.where.not(id: lines.map(&:id)).first(count - lines.count)
      lines.push(additional_lines).flatten!
    end

    lines
  end
end