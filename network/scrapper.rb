# frozen_string_literal: true

require 'socket'

host = 'www.google.com'
port = 443
path = '/'

req = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print req
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
print body
