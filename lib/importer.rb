class Importer
  def self.import_posts
    Rails.logger.info('Beginning import of posts...')

    post_urls = PostFetcher.fetch
    existing_posts = Post.where(link: post_urls).index_by(&:link)

    created_posts = post_urls.map do |post_url|
      existing_post = existing_posts[post_url]

      if existing_post.present?
        Rails.logger.debug("Already indexed #{post_url}. Skipping.")
        nil
      else
        Post.create!(link: post_url)
      end
    end

    created_posts.compact!

    Rails.logger.info("Successfully created #{created_posts.count} #{'post'.pluralize(created_posts.count)} to database.")
  end

  def self.import_lines
    Rails.logger.info('Beginning import of lines...')

    total = Post.unprocessed.count

    Rails.logger.info("#{total} #{'post'.pluralize(total)} to be processed.")

    Post.unprocessed.find_each do |post|
      Rails.logger.info("Processing Post ##{post.id}: #{post.link}.")

      lines = LineFetcher.fetch(post.link)
      Rails.logger.info("Found #{lines.count} lines to be added.")
      lines_persisted = lines.inject(0) do |num, line|
        begin
          if Line.create(line_text: line, post_id: post.id)
            add = 1
          else
            add = 0
          end
        rescue => e
          Rails.logger.error("ERROR: #{e.message}")
          add = 0
        end

        num + add
      end

      post.update_attributes(processed: true)

      Rails.logger.info("Persisted #{lines_persisted} lines to database.")
      Rails.logger.info('Post processed.')
    end

    Rails.logger.info('Done.')
  end
end