require_relative 'environment.rb'
require_relative 'kitten_dispatch/kitten_mailer.rb'
require_relative 'kitten_dispatch/kitten_downloader.rb'
require_relative 'kitten_dispatch/whitelist_reader.rb'

module KittenDispatch
  
  # Download the kitten
  download_data = KittenDownloader.download_kitten(save_path: ENV['KITTEN_LOADER_SAVE_PATH'], subreddit: ENV['KITTEN_LOADER_SUBREDDIT'])
  
  # Send the kitten to each email in whitelist.txt
  WhitelistReader.read_whitelist(ENV['KITTEN_WHITELIST_FILEPATH']).each do |email|
    KittenMailer.mail_kitten(recipient: email, caption: download_data[:caption], file_path: download_data[:filepath])
  end
    
end