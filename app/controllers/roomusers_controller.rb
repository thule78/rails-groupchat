class RoomusersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @roomuser = @room.roomusers.where(user_id: current_user.id).first_or_create
    redirect_to @room, notice: 'welcome to channel'

  end

  def destroy
    @roomuser = @room.roomusers.where(user_id: current_user.id).destroy_all
    redirect_to root_path, alert: "You leave this channel"
  end

  private
  def set_room
    @room = Room.find(params[:room_id])

  end
end
