
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

      get '/' do

    
       end

    #CREATE
    get '/articles/new' do 
 
    erb :new
    end

    post '/articles' do 
   
    article = Article.create(params)
   
    
    #binding.pry
    redirect "/articles/#{article.id}"
    end
      
      get '/articles' do
    @articles = Article.all
    erb :index
    end


   get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
    end
       get '/articles/:id/edit' do
       @article = Article.find(params[:id])
    erb :edit
    end

     patch '/articles/:id' do
      #binding.pry
      article = Article.find(params[:id])
      
    
      article.update(:title => params["title"], :content => params["content"])

      # updated_params = {}
      # updated_params[:title] = params["title"]
      # updated_params[:content] = params["content"]

      # article.update(updated_params)
      redirect "/articles/#{article.id}"

    end

    delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy
    erb :delete

    end

    



 #    #CREATE


 #    #READ
 #     get '/articles' do
 #    @articles = Article.all
 #    erb :index
 #    end
    #  get '/articles/:id' do 
    # @article = Article.find(param[:id])
    # erb :show
    # end


 #    #READ


 #    #UPDATE
 #    get '/articles/:id/edit' do
 #       @article = Article.find(param[:id])
 #    erb :edit
 #    end
    

 #    patch '/articles/:id' do
 #      article = Article.find(params[:id])
 #      article.update(params[:article])
 #    end





 #    #UPDATE

 #    #DELETE

 #    delete '/articles/:id/delete' do
 #    @article = Article.find(params[:id])
 #    @article.destroy
 #    erb :delete

 #    end


		
	 end
