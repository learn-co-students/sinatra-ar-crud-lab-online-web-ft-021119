
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do 
    # binding.pry
    Article.create(params)
    # binding.pry
    redirect "/articles/#{Article.last.id}"

  end

  get '/articles' do 
    @articles = Article.all 
    erb :index
  end

  get '/articles/:id' do 
    # binding.pry
    @article = Article.find_by(params)
    erb :show
  end

  get '/articles/:id/edit' do 
      # binding.pry
      @article = Article.find_by(params)
      erb :edit
  end

  patch '/articles/:id' do 
    # binding.pry
    update = {}
    update[:title] = params["title"]
    update[:content] = params["content"]
    @article = Article.update(update)
    # binding.pry
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do 
    # binding.pry
    Article.delete(params[:id])
    
    erb :index
    
  end






end
