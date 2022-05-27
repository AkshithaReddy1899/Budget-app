class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = Group.where(user_id: current_user.id)
    @entities = Entity.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    new_group = Group.new(group_params)
    new_group.user_id = current_user.id
    if new_group.save
      redirect_to groups_path
      flash[:success] = 'New category added!'
    else
      redirect_to new_group_path
      flash[:alert] = 'Category not added. Try again!'
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
