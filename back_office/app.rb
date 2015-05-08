# coding: utf-8
require 'mongo'
require 'sinatra'
require "sinatra/reloader" if development?
require 'mongo'
require 'json/ext' # required for .to_json


include Mongo

configure { set :server, :puma }

configure do
  conn = MongoClient.new("localhost", 27017)
  set :mongo_connection, conn
  set :mongo_db, conn.db('huo100')
end

get '/' do
  # content_type :json
  # settings.mongo_db.collection_names.to_json
  "要么不活 要么活100"
end

post '/' do
  sos = JSON.parse( request.body.read )
  sos["GPS"]
end

get '/map' do
  @key = 'fa6ee6f56cf5b14572e39201782fad33'
  erb :map
end

