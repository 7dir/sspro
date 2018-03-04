json.extract! client, :id, :name, :port, :password, :st, :ldate, :ndate, :cash, :ver, :device, :mac, :ip, :desc, :created_at, :updated_at
json.url client_url(client, format: :json)
