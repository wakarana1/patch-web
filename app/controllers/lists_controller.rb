class ListsController < ApplicationController

  def index
    @lists = List.all
    @list  = List.new
  end

  def create

    @list = List.new(list_params)
    @list.save
    redirect_to lists_path

  end

  def list_params
    params.require(:list).permit(:name)
  end

end