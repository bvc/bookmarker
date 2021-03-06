class BookmarksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :export_all]
  before_filter :correct_user, only: :destroy

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

  def export_all
    @bookmarks = current_user.bookmarks
  end

  private
    def correct_user
      @bookmark = current_user.bookmarks.find_by_id(params[:id])
      redirect_to root_path if @bookmark.nil?
    end
end