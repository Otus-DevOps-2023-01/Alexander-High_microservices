require 'sinatra'
require 'sinatra/reloader'
require 'json/ext' # for .to_json
require 'haml'
require 'uri'
require 'mongo'
require './helpers'


configure do
    db = Mongo::Client.new([ ENV['DATABASE_URL'] || '127.0.0.1:27017' ], database: 'user_posts', heartbeat_frequency: 2)
    set :mongo_db, db[:posts]
    set :comments_db, db[:comments]
    set :bind, '0.0.0.0'
    enable :sessions
end

before do
  session[:flashes] = [] if session[:flashes].class != Array
end

get '/' do
  @title = 'All posts'
  begin
    @posts = JSON.parse(settings.mongo_db.find.sort(timestamp: -1).to_a.to_json)
  rescue
    session[:flashes] << { type: 'alert-danger', message: 'Can\'t show blog posts, some problems with database. <a href="." class="alert-link">Refresh?</a>' }
  end
  @flashes = session[:flashes]
  session[:flashes] = nil
  haml :index
end


get '/new' do
    @title = 'New posts'
    @flashes = session[:flashes]
    session[:flashes] = nil
    haml :create
end

post '/new/?' do
  db = settings.mongo_db
  if params['link'] =~ URI::regexp
    begin
      result = db.insert_one title: params['title'], created_at: Time.now.to_i, link: params['link'], votes: 0
      db.find(_id: result.inserted_id).to_a.first.to_json
    rescue
      session[:flashes] << { type: 'alert-danger', message: 'Can\'t save your post, some problems with the post service' }
    else
      session[:flashes] << { type: 'alert-success', message: 'Post successuly published' }
    end
    redirect '/'
  else
    session[:flashes] << { type: 'alert-danger', message: 'Invalid URL' }
    redirect back
  end
end


get '/:id/?' do
  @post = JSON.parse(document_by_id(params[:id]))
  id   = object_id(params[:id])
  @comments = JSON.parse(settings.comments_db.find(post_id: "#{id}").to_a.to_json)
  @flashes = session[:flashes]
  session[:flashes] = nil
  haml :show
end

post '/:id/comment/?' do
  content_type :json
  db = settings.comments_db
  begin
    result = db.insert_one post_id: params[:id], name: params['name'], email: params['email'], body: params['body'], created_at: Time.now.to_i
    db.find(_id: result.inserted_id).to_a.first.to_json
  rescue
    session[:flashes] << { type: 'alert-danger', message: 'Can\'t save your comment, some problems with the comment service' }
  else
    session[:flashes] << { type: 'alert-success', message: 'Comment successuly published' }
  end
    redirect back
end