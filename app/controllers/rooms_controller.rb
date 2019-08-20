class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all

  end

  def show
    @rooms = Room.all
    @room_user = current_user.roomusers.find_by(room_id: @room.id)

  end

  def new
    @room = Room.new

  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: "New channel added successfully"
    else
      render :new, alert: 'something went wrong, pls do agian'
    end

  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
  def room_params
    params.require(:room).permit(:name)

  end
end
