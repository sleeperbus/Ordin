require 'socket'

hostname = "localhost"
hostname = "localhost"
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets
	puts line
end
s.close