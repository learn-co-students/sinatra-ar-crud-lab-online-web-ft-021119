
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  #  erb :first
  end

  #post '/articles/new' do
  #  erb :new
  #end
  #Create
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    temp = Article.create(params)
    #binding.pry
    redirect "/articles/#{temp.id}"
  end

  #Read
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  #Update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @id = params[:id]
    temp = {}
    @article = Article.find(@id)
    temp[:title] = params[:title]
    temp[:content] = params[:content]
    @article.update(temp)

    redirect "/articles/#{@id}"
  end

  #Delete
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy

    erb :delete
  end
end
