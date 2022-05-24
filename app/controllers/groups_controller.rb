class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    new_group = Group.new(group_params)
    new_group.user_id = current_user.id
    new_group.save
    if new_group.save
      redirect_to group_entities_path(new_group.id)
      flash[:success] = "New category added!"
    else
      redirect_to new_group_path
      flash[:alert] = "Category not added. Try again!"
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
