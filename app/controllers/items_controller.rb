class ItemsController < ApplicationController
   before_action :user_authorized
  def create
    print 'this is the function i am hitting'
    @list = List.find(params[:list_id])
    # @item = @list.items.create(item_params)
    # @item = @list.items.build(item_params)
    # @item.save
    # the above works just like the code below
    @item=Item.create(item_params.merge(list: @list, user: current_user))

    if @item.save
      redirect_to @list
      #is this redundant? both should take you back to the same list regardless
    else
      redirect_to :back
    end

  end

  def update
   @item = Item.find(params[:id])
   @item.update(item_params)

   redirect_to list_path(@item.list)
  end

  def destroy
    @list=List.find(params[:list_id])
    @item=@list.items.find(params[:id])
    @item.destroy
    redirect_to @list
  end

  private

    def item_params
      params.require(:item).permit(:description, :completion)
    end

end
