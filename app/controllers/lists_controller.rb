class ListsController < ApplicationController
   before_action :user_authorized

  def index
    @list = List.new
    @lists = List.where(user: current_user)
  end

  def show
    @list = List.find(params[:id])
    if @list.user==current_user || @list.users.include?(current_user)
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
    @lists = List.where(user: current_user)
    render :index
  end
end



def shared_lists
  @lists = current_user.lists_shared
  @list=List.new
  #solve how to share lists..
end

def destroy
  # raise params.inspect
  @list=List.find(params[:id])

  @list.destroy
  redirect_to lists_path
end

def edit
  @shared_list=SharedList.new
  @users=User.all
  @list=List.find(params[:id])
end

def update


end

def create_shared_list

  @list=List.find(params[:id])
  @shared_list=SharedList.new(list: @list, user: User.first)


  redirect_to lists_path

end
  private

    def list_params
      params.require(:list).permit(:name, :user)
    end
end
