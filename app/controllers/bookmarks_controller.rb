require 'embedly'
require 'json'

class BookmarksController < ApplicationController
  before_action :set_topic
  before_action :set_bookmark, except: [:new, :create, :index]
  
  def show
  end

  def new
    @bookmark = current_user.bookmarks.new
  end

  def edit
  end
  
  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic
    
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render action: 'new'
    end
  end
  
  def update
    
    authorize @bookmark
    
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end 
  end
  
  
  def index
    @bookmarks = current_user.bookmarks.all
  end
  
  private 
  
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
  
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  
  def bookmark_params
    params.require(:bookmark).permit(:title)
  end
end
