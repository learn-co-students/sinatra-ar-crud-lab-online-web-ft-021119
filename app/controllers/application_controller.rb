
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

   configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
      @article = Article.create(params)
      redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    #binding.pry
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @id = params[:id]
    @article = Article.find(@id)
    erb :show
  end

  get '/articles/:id/edit' do
    #binding.pry
    @id = params[:id]
    @article = Article.find(@id)
    erb :edit
  end

  patch '/articles/:id' do
    @id = params[:id]
    @article = Article.find(@id)
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end


  delete '/articles/:id' do
    @id = params[:id]
    Article.find(@id).destroy
  end
end