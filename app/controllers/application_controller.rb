
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

##CREATE CRUD Actions
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    erb :index
  end

##READ CRUD Actions
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(params[:id])
    erb :show
  end

##UPDATE CRUD Actions
  get '/articles/:id/edit'
  erb :edit

  patch '/articles/:id' do
    @article = Article.find_by(params[:id])
    #NEED to update and save revised Article object
  end

##DELETE CRUD Actions
  delete '/articles/:id' do

  end


end
