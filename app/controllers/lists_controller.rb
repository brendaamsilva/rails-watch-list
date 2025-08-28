class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)
    redirect_to lists_path
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
