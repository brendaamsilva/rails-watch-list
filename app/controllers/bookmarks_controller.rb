class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
   @list = List.find(params[:id])
   @bookmark = @list.bookmarks.new(bookmark_params)
   if @bookmark.save
      redirect_to @list, notice: "Bookmark added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
