class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index

#  @clients = Client.all

    require 'json'
    f = File.read('config.json')
    @c = JSON.parse(f)
    @m = JSON.parse(f)['port_password']
    @c2=[]
 #@m.to_a do |v,k|
 #   @c2 << Client.find_by_port(v)
 #end

  @clients = Client.all

#  @clients = Client.find_by_port(@json_data)
#  @new_users = json_data.each do |key,value|
#    @clients << Client.find_by_port(value)
    #Client.create(:port => key, :password => value)
#  end
    
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save

      `echo 'add: {"server_port": #{@client.port}, "password":#{@client.password} }' | socat -t 0 - UDP:127.0.0.1:6001`

        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    `echo 'remove: {"server_port": #{@client.port} }' | socat -t 0 - UDP:127.0.0.1:6001`
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :port, :password, :st, :ldate, :ndate, :cash, :ver, :device, :mac, :ip, :desc)
    end
end
