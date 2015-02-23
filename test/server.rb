require 'socket'

server = TCPServer.open(2000)  
loop {
	Thread.start(server.accept) do |client|
		method, path, protocol = client.readline.split(" ")
		puts "method : #{method} path: #{path} protocol: #{protocol}"
		if method == "GET"	
			client.puts(File.readlines("./index.html"))
		else 
			client.puts(Time.now.ctime)
			client.puts "Closing the connection. Bye."
		end
		client.close
	end
}