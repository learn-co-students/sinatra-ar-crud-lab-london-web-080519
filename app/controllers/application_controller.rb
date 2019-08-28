
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #INDEX
  get '/' do
    @articles = Article.all
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #NEW
  get '/articles/new' do
    erb :new
  end

  #SHOW
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #CREATE
  post '/articles' do
    article = Article.create(params[:article])
    redirect to "/articles/#{article.id}"
  end

  #EDIT
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #UPDATE
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end
  
  #DESTORY
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
