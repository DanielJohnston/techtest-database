require 'sinatra/base'


class Database < Sinatra::Base
  # Get Sinatra to use port 4000 as required in spec
  set :port, 4000

  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
