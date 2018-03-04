class Client < ApplicationRecord
  after_commit :ping

  def ping
    require 'socket'

    client_socket = UDPSocket.new
    client_socket.connect("", 6001)
    client_socket.puts "ping"
    reply, from = client_socket.recvfrom( 20, 0 )
    puts reply
    client_socket.close	
  end
end
