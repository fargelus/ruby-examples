# frozen_string_literal: true

require 'socket'
require 'uri'
require 'cgi'
require_relative 'calc_price'

class Server
  def initialize(port)
    @connection = TCPServer.open(port)
  end

  def launch
    loop do
      @client = @connection.accept
      @request = @client.gets
      respond
      @client.close
    end
  end

  private

  def respond
    params = receive_params
    if params
      @client.print "HTTP/1.1 200\r\n"
      @client.print "Content-Type: text/html\r\n"
      @client.print "\r\n"

      price = CalcPrice.call(params)
      @client.print "Hello! Your price is #{price}"
    end
  end

  def receive_params
    url = @request.split(' ')[1]
    query = URI(url).query
    CGI.parse(query).transform_values(&:first) if query
  end
end
