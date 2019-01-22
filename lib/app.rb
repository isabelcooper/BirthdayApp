# require 'socket'
#
# def run_server
#   server = TCPServer.new(2345)
# loop do
#   socket = server.accept

require 'sinatra'
require 'shotgun'

    get '/' do
      @name = params[:name]
      erb(:index)
    end

    get '/happy-birthday' do
      erb(:happy_birthday)
    end

    get '/countdown' do
      "Countdown"
    end
