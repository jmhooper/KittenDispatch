# Mailer configs
ENV['KITTEN_SMTP_FROM_EMAIL'] = 'your_emailh@gmail.com'
ENV['KITTEN_SMTP_ADDRESS'] = 'smtp.gmail.com'
ENV['KITTEN_SMTP_PORT'] = '587'
ENV['KITTEN_SMTP_DOMAIN'] = 'gmail.com'
ENV['KITTEN_SMTP_USERNAME'] = 'your_email@gmail.com'
ENV['KITTEN_SMTP_PASSWORD'] = 'your_password'

# Loader configs
ENV['KITTEN_LOADER_SAVE_PATH'] = "/tmp/kitten"
ENV['KITTEN_LOADER_SUBREDDIT'] = 'cats'

# Whitelist reader configs
ENV['KITTEN_WHITELIST_FILEPATH'] = "./whitelist.txt"