json.(poem, :id, :created_at)
json.lines poem.lines.map(&:line_text) #, partial: 'line', as: :line