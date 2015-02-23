require 'socket'

#host = "www.tutorialspoint.com"
#port = 80
host = "localhost"
port = 2000
path = "/index.htm"

request = "GET #{path} HTTP/.10\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
while line = socket.gets
    puts line
end

#headers, body = response.split("\r\n\r\n", 2)
#print body