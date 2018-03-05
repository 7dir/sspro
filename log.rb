IO.popen('~/gocode/bin/shadowsocks-server -d -c ~/config.json') do |io|
  while (line = io.gets) do
    puts line
  end
end
