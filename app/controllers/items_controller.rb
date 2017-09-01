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
      respond_to do |f|
             f.html {redirect_to list_path(@list)}
             f.json {render :json => @item}
           end
         else
           render "lists/show"
         end
       end

  def update
   @item = Item.find(params[:id])
   @item.update(item_params)

   redirect_to list_path(@item.list)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |f|
      f.json {render :json => @item}
      f.html {redirect_to list_path(@item.list)}
    end
  end

  private

    def item_params
      params.require(:item).permit(:description, :completion)
    end

end
