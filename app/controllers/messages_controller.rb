class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages

    #サイドバーの表示用
    @groups = Group.all

    @message = Message.new
  end

  def new
  end

  def create
    @message = Message.new(message_params)

    #render用の変数
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @messages = @group.messages

    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]) }
        format.json
      end
    else
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
