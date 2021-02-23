# frozen_string_literal: true

require 'socket'

host, port = ARGV

begin
  STDOUT.print 'Connecting...'
  STDOUT.flush

  s = TCPSocket.open(host, port)
  STDOUT.puts 'Done'

  local = s.addr
  peer = s.peeraddr
  STDOUT.print "Connected to #{peer[2]}:#{peer[1]}"
  STDOUT.puts " use local port #{local[1]}"

  begin
    sleep(0.5)
    msg = s.read_nonblock(4096)
    STDOUT.puts msg.chop
  rescue SystemCallError
    # Ignore
  end

  loop do
    STDOUT.print '> '
    STDOUT.flush
    local = STDIN.gets
    break unless local

    s.puts local
    s.flush

    response = s.readpartial(4096)
    puts response.chop
  end
rescue StandardError
  puts $ERROR_INFO
ensure
  s&.close
end
