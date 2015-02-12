require 'socket'

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  puts client.read
  client.puts(Time.now.ctime)  # Send the time to the client
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}
# loop {
# 	Thread.start(server.accept) do |client|
# 		line = client.read
# 		puts line
# 		method, path, protocol = client.read.split(" ")
# 		if method == "GET"	
# 			client.puts(File.read("index.html"))
# 		else 
# 			client.puts(Time.now.ctime)
# 			client.puts "Closing the connection. Bye."
# 			client.close
# 		end
# 	end
# }