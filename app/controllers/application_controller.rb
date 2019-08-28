
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #read
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #create form
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles' do
    input = params[:article]
    # binding.pry
    @article = Article.create(input)
    redirect "/articles/#{@article.id}"
  end

  #edit form
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end


  #update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #show
   get "/articles/:id" do
    @article = Article.find(params[:id])
     erb:show
   end

   delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end

end
