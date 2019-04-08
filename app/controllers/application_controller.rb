require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
#INDEX CRUD Action
  get '/articles' do
    @articles = Article.all
    erb :index
  end
##CREATE CRUD Actions
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @articles = Article.create(title: params[:title], content: params[:content])
    binding.pry
    redirect to "/articles/#{@article.id}"
  end

##READ CRUD Actions
  get '/articles/:id' do
    @article = Article.find_by(params[:id])
    erb :show
  end

##UPDATE CRUD Actions
  get '/articles/:id/edit' do
    @article = Article.find_by(params[:id])
    erb :edit
  end


  patch '/articles/:id' do
    @article = Article.find_by(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    # @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

##DELETE CRUD Actions
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end
