class EventPicturesController < ApplicationController
  before_action :set_event_picture, only: [:show, :edit, :update, :destroy]

  # GET /event_pictures
  # GET /event_pictures.json
  def index
    @event_pictures = EventPicture.all
  end

  # GET /event_pictures/1
  # GET /event_pictures/1.json
  def show
  end

  # GET /event_pictures/new
  def new
    @event_picture = EventPicture.new
  end

  # GET /event_pictures/1/edit
  def edit
  end

  # POST /event_pictures
  # POST /event_pictures.json
  def create
    @event_picture = EventPicture.new(event_picture_params)

    respond_to do |format|
      if @event_picture.save
        format.html { redirect_to @event_picture, notice: 'Event picture was successfully created.' }
        format.json { render :show, status: :created, location: @event_picture }
      else
        format.html { render :new }
        format.json { render json: @event_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_pictures/1
  # PATCH/PUT /event_pictures/1.json
  def update
    respond_to do |format|
      if @event_picture.update(event_picture_params)
        format.html { redirect_to @event_picture, notice: 'Event picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_picture }
      else
        format.html { render :edit }
        format.json { render json: @event_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_pictures/1
  # DELETE /event_pictures/1.json
  def destroy
    @event_picture.destroy
    respond_to do |format|
      format.html { redirect_to event_pictures_url, notice: 'Event picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_picture
      @event_picture = EventPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_picture_params
      params.require(:event_picture).permit(:event_id, :image)
    end
end
