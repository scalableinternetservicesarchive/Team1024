class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @pane_1_status = "active"
    @pane_3_status = ""
    @search = Event.search do
      keywords params[:search]
    end

    if (params[:search].nil? || params[:search].empty? || params[:search].blank?)
      @events = nil
    else
      @events = @search.results
    end
  end

  def search
  
    @search = Event.search do
      fulltext params[:search]
    end

    if (params[:search].nil? || params[:search].empty? || params[:search].blank?)
      @events = nil
    else
      @events = @search.results
    end

    respond_to do |format| 
      @pane_1_status = ""
      @pane_3_status = "active"
      format.html { render :show }
      format.js
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def save
    @fav_event = Event.find(params[:fav])
    @eid = @fav_event.id
    if current_user.favorited_events.include?(@fav_event) == false
      current_user.favorited_events << @fav_event
    end

    respond_to do |format|
        format.html { redirect_to :back }
        format.js
    end
  end
  
  

  def delete
    @delete_event = Event.find(params[:delete_fav])
    @eid = @delete_event.id
    current_user.favorited_events.delete(@delete_event)
    respond_to do |format|
        format.html { redirect_to :back }
        format.js { render "delete" }
    end
  end

  def quit
    @quit_event = Event.find(params[:delete_att])
    @quit_line = @quit_event.line
    @eid = @quit_event.id
    current_user.attended_events.delete(@quit_event)
    current_user.lines.delete(@quit_line)
    respond_to do |format|
        format.html { redirect_to :back }
        format.js
    end
  end

  def line
    
    @attend_event = Event.find(params[:line_event])
    @eid = @attend_event.id
    if @attend_event.line == nil
      redirect_to :back, notice: "The line has not yet been started."
      return
    end
    
    if current_user.attended_events.include?(@attend_event) == false
      current_user.attended_events << @attend_event
      current_user.lines << @attend_event.line
      current_user.save()
      ## xih: the original code is not needed because we get the user-line relation through events.
    end

    respond_to do |format|
        format.html { redirect_to :back }
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].permit(:first_name, :last_name, :phone_number)
    end
end
