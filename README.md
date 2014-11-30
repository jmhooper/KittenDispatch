# Kitten Dispatch

Kitten dispatch is a tool for downloading cat pictures from reddit and emailing them to your friends.

## Getting Started

1. Clone the project
2. Setup the `environment.rb` and `whitelist.txt` files. Look at the `environment.example.rb` and `whitelist.example.txt` files for examples
3. Run kitten dispatch with `ruby kitten_dispatch.rb`

## How it works

Kitten dispatch finds the top picture on a certain subreddit and emails it to all of the addresses specified in your `whitelist.txt` file.
Emailing is acheived with the ActionMailer gem.
You can modifiy the action mailer SMTP settings in your `environment.rb` file to use your email address.

I get pictures from [r/cats](www.reddit.com/r/cats).
I would suggest checking out [r/CatGifs](www.reddit.com/r/CatGifs) or [r/LolCats](www.reddit.com/r/LolCats) as well.
You can change which subreddit the pictures are loaded from by setting the `KITTEN_LOADER_SUBREDDIT` environment variable in your environment.rb file.

I have mine on setup a cron task to email me and my friends everyday at 3:00 PM since that is usually the most stressful part of our day.