class PostFetcher < AbstractExternalFetcher
  CSS_SELECTOR = 'a.result-title.hdrlnk'
  URL_REGEX = Regexp.new('\/[a-zA-z]{3}\/mis\/\d{10}.html')

  def self.fetch(url = 'https://newyork.craigslist.org/search/mis')
    Rails.logger.info("Fetching #{url} for post URLs...")

    response = get(url)
    Rails.logger.debug('Fetched document.')

    doc = Nokogiri::HTML(response.body)

    urls = doc.css(CSS_SELECTOR).map { |elem| elem.attr('href') }

    Rails.logger.debug("Found #{urls.count} urls on page.")

    urls.select! do |url|
      if URL_REGEX.match(url)
        Rails.logger.debug("Adding #{url}.")
        true
      else
        Rails.logger.warn("Found url '#{url}' that does NOT pass regex test. Excluding.")
        false
      end
    end

    uri = URI.parse(url)

    urls.map do |url|
      if url =~ /^http/
        url
      else
        host_and_path = "#{uri.host}/#{url}".gsub(/\/+/, '/')
        "#{uri.scheme}://#{host_and_path}"
      end
    end
  end
end