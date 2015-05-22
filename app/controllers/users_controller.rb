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
    @search = Event.search do
      fulltext params[:search]
    end

    if (params[:search].nil? || params[:search].empty? || params[:search].blank?)
      @events = nil
    else
      @events = @search.results
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
    if current_user.favorited_events.include?(@fav_event) == false
      current_user.favorited_events << @fav_event
    end
    redirect_to :back
  end

  def delete
    @delete_event = Event.find(params[:delete_fav])
    current_user.favorited_events.delete(@delete_event)
    redirect_to :back
  end

  def quit
    @quit_event = Event.find(params[:delete_att])
    current_user.attended_events.delete(@quit_event)
    redirect_to :back
  end

  def line
    
    @attend_event = Event.find(params[:line_event])

    if @attend_event.line == nil
      redirect_to :back, notice: "The line has not yet been started."
      return
    end

    if current_user.attended_events.include?(@attend_event) == false
      current_user.attended_events << @attend_event

      ## xih: the original code is not needed because we get the user-line relation through events.

    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
