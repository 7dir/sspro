require 'socket'
require 'rubygems'
require 'eventmachine'

module DNSServer
    def receive_data(data)
        # Forward all data
        conn = UDPSocket.new
        conn.send data, 0, '8.8.8.8', 53
        send_data conn.recv 4096
    end
end

EM.run do
    EM.open_datagram_socket '0.0.0.0', 53, DNSServer
end
