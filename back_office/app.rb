require 'mongo'
require 'sinatra'
require 'mongo'
require 'json/ext' # required for .to_json

class Pumatra < Sinatra::Base
  include Mongo

  configure { set :server, :puma }

  configure do
    conn = MongoClient.new("localhost", 27017)
    set :mongo_connection, conn
    set :mongo_db, conn.db('huo100')
  end

  get '/' do
    content_type :json
    settings.mongo_db.collection_names.to_json
  end

  post '/' do
    sos = JSON.parse( request.body.read )
    sos["GPS"]
  end

  get '/map' do
    erb :map
  end
end
