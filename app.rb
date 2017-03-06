require 'sinatra/base'


class Database < Sinatra::Base
  # Get Sinatra to use port 4000 as required in spec
  set :port, 4000

  get '/' do
    erb :index
  end

  post '/set' do
    # Per the spec, setting has to be a GET method
    # This means we can use the POST to convert two params to one in GET
    @key = params[:somekey]
    @value = params[:somevalue]
    redirect "/set?#{@key}=#{@value}"
  end

  get '/set' do
    erb :set
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
