module Lineable
  extend ActiveSupport::Concern

  LINE_COUNT = 10

  included do
    after_create :increment_line_count
  end

  def increment_line_count
    # Couldn't get it working without the reload.
    # Ideally, this should be removed.
    reload
    self.lines.update_all('count = count + 1')
  end

  module ClassMethods

    def fetch_unused_lines
      # TODO: Using order => RAND() is not performant. Consider another method.
      lines = Line.unused.random.first(LINE_COUNT)

      # No longer have unused lines, go and find any you need.
      if lines.count != LINE_COUNT
        additional_lines = Line.random.where.not(id: lines.map(&:id)).first(LINE_COUNT - lines.count)
        lines.push(additional_lines).flatten!
      end

      lines
    end

  end

end