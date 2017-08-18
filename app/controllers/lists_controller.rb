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
  end

  def destroy
    # raise params.inspect
    @list=List.find(params[:id])

    @list.destroy
    redirect_to :back
  end

  def edit
    @share=SharedList.new
    @users=User.where.not(id: current_user.id)
    @list=List.find(params[:id])
    @user_ids = @list.user_ids
  end

  def update
    list=List.find(params[:id])
    user=User.find(params[:user_id])
    shared=SharedList.find_by(list: list, user: user)
    if shared
      shared.delete
    else
      SharedList.create(list:list, user: user)
    end
    redirect_to :back
  end

  def delete_shared
    @list=List.find(params[:id])
    @shared=SharedList.find_by(list: @list, user: current_user)
    @shared.destroy

    redirect_to :back

  end

  # def create_shared_list
  #   @list=List.find(params[:list])
  #   @user=User.find(params[:user])
  #   @shared_list=SharedList.new(list: @list, user: @user)
  #   redirect_to lists_path
  # end

  private
    def list_params
      params.require(:list).permit(:name, :user)
    end
end
