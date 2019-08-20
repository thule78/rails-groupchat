class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def index

  end

  def show

  end

  def new

  end

  def create
    @chat = @room.chats.new(chat_params)
    @chat.user = current_user

    if @chat.save
      ActionCable.server.broadcast 'chat_channel',
                                    content: @chat.text
      return redirect_to room_path(@room)
    end


  end

  private
  def set_room
    @room = Room.find(params[:room_id])
  end
  def chat_params
    params.require(:chat).permit(:text)
  end
end
