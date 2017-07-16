class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @item=Item.new
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to @list
    else
      redirect_to :root
    end

  end
  private

    def list_params
      params.require(:list).permit(:name)
    end
end
