
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  	@articles = Article.select(:title)
  	erb :index
  end

  
  get '/articles/new' do 
  	erb :new


   end
   get '/arcticles' do 
   	@article = Arcticle.new(params[:article])
   	erb :show

   end
   get '/article/:id' do 
   	@article = Article.find(param[:id])

   end


		
	end
