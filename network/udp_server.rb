# frozen_string_literal: true

require 'socket'

port = ARGV[0]

ds = UDPSocket.new
ds.bind(nil, port)

loop do
  request, address = ds.recvfrom(1024)
  response = request.upcase

  clientaddr = address[3] # client's ip
  clientname = address[2] # hostname
  clientport = address[1]

  ds.send(response, 0, clientaddr, clientport)
  puts "Connected from #{clientname}:#{clientport}"
end
