require "json"
require "net/http"
require "open-uri"

module KittenDispatch
  class KittenDownloader
    
    def self.download_kitten(hash)
      # Load the values from the hash
      filepath = hash[:save_path]
      subreddit = hash[:subreddit]
      
      # Create and execute request for the JSON
      response = nil
      Net::HTTP.start("www.reddit.com") do |http|
        response = http.get("/r/#{subreddit}.json")
      end
      
      # Parse the JSON and iterate over the posts to find a valid one      
      result = JSON.parse(response.body)
      
      # Find the post from the json
      post = self.post_from_json(result)
      
      # Download the image
      filepath = filepath + File.extname(post[:url])
      self.download_kitten_image(post[:url], filepath)
      
      # Return the post hash
      { caption: post[:title], filepath: filepath }
    end
    
    private
    
    def self.post_from_json(json)
      # Create a hash to return
      post = Hash.new
      
      # Iterate until a valid post is found
      json['data']['children'].each do |post_json|
        if ['.png', '.jpg', '.jpeg', '.gif'].include? File.extname(post_json['data']['url'])
          # Set the post parameters
          post[:title] = post_json['data']['title']
          post[:url] = post_json['data']['url']
          break
        end
      end
      
      # Return the post
      post
    end
    
    def self.download_kitten_image(url, save_path)
      # Open the file
      File.open(save_path, 'wb') do |save_file|
        # Use open-uri to save the image to the file
        open(url, 'rb') do |read_file|
          save_file.write(read_file.read)
        end
      end
    end
    
  end
end

KittenDispatch::KittenDownloader.download_kitten(save_path: "/tmp/kitten", subreddit: "cats")