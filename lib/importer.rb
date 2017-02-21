class Importer
  # TODO: Create a default flag on posts called 'processed'
  # that defaults to false. When created, the flag is false.
  # Create another method called import_lines that iterates over
  # all of the posts that have 'processed' as false and get their lines.
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
end