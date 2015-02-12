require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
	attr_reader :client 

	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
		Bitly.use_api_version_3
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "Too long message"
		end
	end
	
	def dm(target, message)
		screen_names = followers_list
		puts "Trying to send #{target} this direct message"
		puts message
		
		if screen_names.include? target
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "You can only dm people whow follows you."
		end 
	end
	
	def followers_list
		@client.followers.collect do |follower|
			@client.user(follower).screen_name
		end
	end
	
	def spam_my_followers(message)
		screen_names = followers_list
		screen_names.each do |name|
			dm(name, message)
		end
	end
	
	def everyones_last_tweet
		friends = @client.friends
		friends.each do |friend|
			message = friend.status.text
			puts "#{friend.screen_name} said..."
			puts message
			puts ""
		end
	end

	def shorten(original_url)
		puts "Shortening this URL: #{original_url}"
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6');
		bitly.shorten(original_url).short_url
	end

	def run
		command = ""
		while command != "q"
			printf "Enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
			when "q" then puts "Goodbye!"
			when "t" then tweet(parts[1..-1].join(" "))
			when "dm" then dm(parts[1], parts[2..-1].join(" "))
			when "spam" then spam_my_followers(parts[1..-1].join(" "))
			when "s" then puts shorten(parts[1])
			when "turl" then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
			# when "elt" then everyones_last_tweet
			else
				puts "Sorry, I don't know how to #{command}"
			end
		end
	end
end

blogger = MicroBlogger.new
blogger.run


