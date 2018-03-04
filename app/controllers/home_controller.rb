class HomeController < ApplicationController

  def add(port, pass)
    #echo 'add: {"server_port": #{port}, "password":#{pass} }' | socat -t 0 - UDP:127.0.0.1:6001

    require 'json'
    file = File.read('config.json')
    @config = JSON.parse(file)
    @json_data = JSON.parse(file)['port_password']
    @new_users = json_data.each do |key,value|
      puts Client.find_by_port(key)
      #Client.create(:port => key, :password => value)
    end

  end

  def del(port)
#     `echo 'remove: {"server_port": #{port} }' | socat -t 0 - UDP:127.0.0.1:6001`
  end


    def ping
      @res= `echo 'ping' | socat -t 0 - UDP:127.0.0.1:6001`
#      require 'socket'
#      client_socket = UDPSocket.new
#      client_socket.connect("", 6001)
#      client_socket.puts "ping"
#      reply, from = client_socket.recvfrom( 20, 0 )
#      @reply=reply
#      puts reply
#      client_socket.close
    end

  def index(file='config.json')

  require 'json'
  @file = File.read(file)
  @clients = JSON.parse(@file)['port_password']
  @new_users = @clients.each do |key,value|
    if Client.find_by_port(key) then
      puts "true"
      @cls << Client.find_by_port("8388")
    else
      Client.create(:port => key, :password => value)
    end
  end
end

end
