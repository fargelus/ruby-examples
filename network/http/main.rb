# frozen_string_literal: true

require_relative 'lib/server'

server = Server.new(8080)
server.launch
