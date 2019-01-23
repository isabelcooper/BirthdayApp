require 'sinatra/base'

class BirthdayGreeter < Sinatra::Base

  get '/' do
    @name = params[:name]
    erb(:form)
  end

  post '/happy-birthday' do
    @name = params[:name]
    @date = params[:date]
    today = Date.today.to_s
    full_date = Date.parse(@date)
    @days = (full_date - Date.today).to_i
    if @date == today
      erb(:happy_birthday)
    else
      erb(:countdown)
    end
  end

end
