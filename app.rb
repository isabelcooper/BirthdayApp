require 'sinatra/base'
require './lib/person'

class BirthdayGreeter < Sinatra::Base

  enable :sessions

  before do
    @person = Person.specific_person
  end

  get '/' do
    @name = params[:name]
    erb(:form)
  end

  post '/name' do
    full_birthday = Date.parse(params[:date])
    @person = Person.create(params[:name], full_birthday, params[:color])
    redirect '/happy-birthday'
  end

  get '/happy-birthday' do
    @plural = "s" if (@person.days_to_next_birthday > 1)
    @person.days_to_next_birthday == 0 ? erb(:happy_birthday) : erb(:countdown)
  end
end
