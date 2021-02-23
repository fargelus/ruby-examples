# frozen_string_literal: true

require 'socket'

server = TCPServer.open(2000)
loop do
  client = server.accept
  client.puts(Time.now.ctime)
  client.close
end
