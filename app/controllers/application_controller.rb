require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  # --- CREATE: NEW ROUTE --- #
  get '/articles/new' do 
    erb :new
  end

  # --- CREATE: CREATE ROUTE --- #
  post '/articles' do
    article = Article.create(params[:article])
    redirect "articles/#{article.id}"
  end


  # --- READ: INDEX ROUTE --- #
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # --- READ: SHOW ROUTE --- #
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


  # --- UPDATE: EDIT ROUTE --- #
  get '/articles/:id/edit' do
    
    @article = Article.find(params[:id])
    # binding.pry
    erb :edit
  end

  # --- UPDATE: UPDATE ROUTE --- #
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "articles/#{@article.id}"
  end


  # --- DESTROY: DELETE ROUTE --- #
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect "/articles"
  end


end

