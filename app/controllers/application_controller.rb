require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  # INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # NEW
  get '/articles/new' do
    erb :new
  end

  # CREATE
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  # SHOW
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # EDIT
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # UPDATE
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  # DESTROY
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
