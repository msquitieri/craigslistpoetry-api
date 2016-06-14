json.(poem, :id, :created_at)
json.lines poem.lines.in_order.map(&:line_text) #, partial: 'line', as: :line