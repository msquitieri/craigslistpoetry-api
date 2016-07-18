file = Rails.root.join('config', 'twitter.yml')

if File.exists?(file)
  TWITTER_CONFIG = YAML.load(File.read(file))[Rails.env].try(:symbolize_keys)
else
  TWITTER_CONFIG = {}
end
