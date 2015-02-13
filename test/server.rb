require 'socket'

server = TCPServer.open(2000)  # Socket to listen on port 2000
# loop {                         # Servers run forever
#   client = server.accept       # Wait for a client to connect
#   client.puts(Time.now.ctime)  # Send the time to the client
#   client.puts "Closing the connection. Bye!"
#   client.close                 # Disconnect from the client
# }
loop {
	Thread.start(server.accept) do |client|
		method, path, protocol = client.readline.split(" ")
		puts "method : #{method} path: #{path} protocol: #{protocol}"
		if method == "GET"	
		  client.puts("Hey")
#			client.puts(File.read("index.html"))
		else 
			client.puts(Time.now.ctime)
			client.puts "Closing the connection. Bye."
		end
		client.close
	end
}