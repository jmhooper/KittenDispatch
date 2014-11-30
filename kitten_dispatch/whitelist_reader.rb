module KittenDispatch
  class WhitelistReader
    
    def self.read_whitelist(filepath)
      # Read the file
      file = File.open(filepath).read
      
      # Remove empty lines and commented lines
      file.gsub!(/^\s*#.*/, '')
      file.gsub!(/^\s*\n/, '')
      
      # Return the array
      file.each_line
    end
    
  end
end