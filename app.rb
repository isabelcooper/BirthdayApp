require 'sinatra/base'
require './lib/date_formatter'

class BirthdayGreeter < Sinatra::Base

  # def initialize(date_formatter = DateFormatter)
  #   @date_formatter = date_formatter.new
  # end

  get '/' do
    @name = params[:name]
    erb(:form)
  end

  post '/happy-birthday' do
    @name = params[:name]
    @date = params[:date]
    full_birthday = Date.parse(@date)
    @days_to_next_birthday = DateFormatter.new.days_to_next_birthday(full_birthday)
    @days_since_past_birthday = DateFormatter.new.days_since_past_birthday(full_birthday)
    @plural = "s" if (@days_to_next_birthday > 1)
      if @date == Date.today.to_s
        erb(:happy_birthday)
      else
        erb(:countdown)
      end
  end

end
