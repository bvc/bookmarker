class BookmarksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    if @bookmark.save
      flash[:success] = "Bookmark created!"
      redirect_to root_path
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to root_path
  end
end