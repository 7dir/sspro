IO.popen('~/gocode/bin/shadowsocks-server -d -c ~/config.json') do |io|
  while (line = io.gets) do
    File.write('ss.log', line, File.size('ss.log'), mode: 'a')
  end
end
