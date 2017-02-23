namespace :import do

  desc 'Import posts from craigslist'
  task posts: :environment do
    Importer.import_posts
  end

  desc 'Import lines from pending posts'
  task lines: :environment do
    # Importer.import_lines
  end

end
