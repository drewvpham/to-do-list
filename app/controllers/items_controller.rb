class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    # @item = @list.items.create(item_params)
    @item = @list.items.build(item_params)
    # @item.save
    # the above works just like the code below
    # @item=Item.create(item_params.merge(list: @list))

    if @item.save
      redirect_to @list
      #is this redundant? both should take you back to the same list regardless
    else

      render 'lists/show'
    end

  end

  def update
   @item = Item.find(params[:id])
   @item.update(item_params)

   redirect_to list_path(@item.list)
  end

  private

    def item_params
      params.require(:item).permit(:description, :completion)
    end

end
