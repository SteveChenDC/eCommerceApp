require 'sinatra' # Brings up sinatra library and Redis
require 'redis'

redis = Redis.new # Establishes connection to Redis Server

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def random_string(length) # Generates alphanumeric string of a certain length
    rand(36**length).to_s(36) 
  end
end

get '/' do # Renders the index.erb page
  erb :index
end

post '/' do # Renders after user sends post
  if params[:url] and not params[:url].empty? # if :url parameter 
    @shortcode = random_string 5
    redis.setnx "links:#{@shortcode}", params[:url] # redis.setnx means 'Set if n exists'
  end
  erb :index # If user does not enter anything it does the same
end

get '/:shortcode' do # Renders when a client visits a link
  @url = redis.get "links:#{params[:shortcode]}" # Grabs the shortcode in the database and redirect
  redirect @url || '/' # Sends them back if not
end