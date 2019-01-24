require 'sinatra/base'
require './lib/person'

class BirthdayGreeter < Sinatra::Base

  enable :sessions

  get '/' do
    @name = params[:name]
    erb(:form)
  end

  post '/name' do
    @name = params[:name]
    @date = params[:date]
    full_birthday = Date.parse(@date)
    $person = Person.new(@name, full_birthday)
    redirect '/happy-birthday'
  end

  get '/happy-birthday' do
    @plural = "s" if ($person.days_to_next_birthday > 1)
    $person.days_to_next_birthday == 0 ? erb(:happy_birthday) : erb(:countdown)
  end
end
