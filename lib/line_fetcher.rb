class LineFetcher < AbstractExternalFetcher
  SENTENCE_DELIMITER = /(?<=[?.!])/
  BEGINNING_WHITESPACE = /^ */
  CSS_SELECTOR = '#postingbody'

  def self.fetch(url = 'https://newyork.craigslist.org/mnh/mis/6012781852.html')
    response = get(url)
    doc = Nokogiri::HTML(response.body)

    container = doc.css(CSS_SELECTOR)

    text_children = container.children.select { |child| child.is_a?(Nokogiri::XML::Text) }
    post_body = text_children.map(&:content).join.strip

    lines = post_body.split(SENTENCE_DELIMITER)

    # Remove beginning whitespace but NOT new lines.
    lines.map { |line| line.sub(BEGINNING_WHITESPACE, '')}
  end
end