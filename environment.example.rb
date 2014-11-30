# Mailer configs
ENV['KITTEN_SMTP_SERVER_FROM_EMAIL'] = 'your_emailh@gmail.com'
ENV['KITTEN_SMTP_SERVER_ADDRESS'] = 'smtp.gmail.com'
ENV['KITTEN_SMTP_SERVER_PORT'] = '587'
ENV['KITTEN_SMTP_SERVER_DOMAIN'] = 'gmail.com'
ENV['KITTEN_SMTP_SERVER_USERNAME'] = 'your_email@gmail.com'
ENV['KITTEN_SMTP_SERVER_PASSWORD'] = 'your_password'

# Loader configs
ENV['KITTEN_LOADER_SAVE_PATH'] = "/tmp/kitten"
ENV['KITTEN_LOADER_SUBREDDIT'] = 'cats'

# Whitelist reader configs
ENV['KITTEN_WHITELIST_FILEPATH'] = "./whitelist.txt"