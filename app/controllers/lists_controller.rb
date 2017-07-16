class ListsController < ApplicationController
   before_action :user_authorized

  def index
    @list = List.new
    @lists = List.where(user: current_user)
  end

  def show
    @list = List.find(params[:id])
    if @list.user==current_user
    @item=Item.new
  else
    redirect_to lists_path
  end
  end


  def create
    @user=User.find(current_user)

    @list = @user.lists.build(list_params)
  if @list.save
    redirect_to list_url(@list)
  else
    @lists = List.all
    render :index
  end
end

def destroy
  # raise params.inspect
  @list=List.find(params[:id])

  @list.destroy
  redirect_to lists_path
end
  private

    def list_params
      params.require(:list).permit(:name)
    end
end
