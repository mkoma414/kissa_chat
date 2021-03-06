class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group.id), notice: '新規グループを作成しました'
    else
      render 'new'
    end

  end

  def edit
    @group = Group.find(params[:id])
    @members = @group.users.where.not(id: current_user.id)
    # @members.delete(id: current_user.id)
    # @members.map{|member|member.delete if member.id == current_user.id }
  end

  def update
    # binding.pry
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path
    else
    end
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
