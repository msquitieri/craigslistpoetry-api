module Lineable
  extend ActiveSupport::Concern

  included do
    after_create_commit :increment_line_count
  end

  def increment_line_count
    self.lines.update_all('count = count + 1')
  end
end