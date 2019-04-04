
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

    #set article title equal to whatever was passed into edit forrm in title field
    @article.title = params[:title]

    #set article content equal to whatever was passed into edit forrm in content field
    @article.content = params[:content]

    #save edited article
    @article.save

    #redirect to page that shows edited article.
    redirect "/articles/#{@article.id}"
  end


  delete '/articles/:id' do
    @id = params[:id]
    Article.find(@id).destroy
  end
end
