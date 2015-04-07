class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    @like = like
    authorize like
 
    if like.save
      flash[:notice] = "Like status added"
    else
      flash[:error] = "Error updating Like status"
    end

    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id]) 
    like = current_user.likes.find(params[:id])  
    authorize like

    if like.destroy
      flash[:notice] = "Like status removed"
    else
      flash[:error] = "Error removing Like status"
    end

    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end
end
