
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
    redirect '/articles/:id'

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




end
