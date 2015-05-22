class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_manager!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_either, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  @event_pictures = @event.event_pictures
  end

  # GET /events/new
  def new
    @event = Event.new
    @event_picture = @event.event_pictures.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    event_params[:manager_id] = current_manager.id
    @event = Event.new(event_params)
    current_manager.events << @event

    respond_to do |format|
      if @event.save && current_manager.save
        params[:event_pictures] && params[:event_pictures]['image'].each do |picture|
          @event_picture = @event.event_pictures.create!(:image => picture, :event_id => @event.id)
        end
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to manager_path(current_manager), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def createLine
    @event = Event.find(params[:startevent])
    redirect_to url_for(:controller => :lines, :action => :new, :belong_event => @event)
    # @event.line << @line
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params[:event].permit(:name, :max_attendance, :create_time, :start_time, :description, post_attachments_attributes: [:id, :event_id, :image])
    end

    def authenticate_either
      unless manager_signed_in?
        authenticate_user!
      else
        true
      end
    end

    def line_params
      params[:line]
    end
end
