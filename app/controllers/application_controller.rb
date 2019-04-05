
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # @articles = Article[:title]
    # binding.pry
    # erb :'index'
  end

  get '/articles/new' do
    erb :'new'
  end

  post '/articles' do
    @article = Article.new(params)
    # redirect '/articles'
    erb :'index'
  end

  get '/articles' do
    @articles = Article.all
    erb :'index'
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :'show'
  end

  get '/articles/:id/edit' do
    erb :'edit'
  end

  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_article = Post.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/articles/#{id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params["id"])
    @particle.destroy
    erb :delete
  end
end
