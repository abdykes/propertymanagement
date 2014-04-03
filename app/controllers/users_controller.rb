class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource #convenience method from cancan

  # GET /users
  # GET /users.json
  def index
    #if current_user
      @users = User.all
    #end
  end

  # GET /users/1
  # GET /users/1.json
  def show
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

    @user.roles << Role.find_by_name("Renter")
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'Registration complete!' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    params[:user][:role_ids] ||=[]

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: 'Profile updated!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #if(params[:id] = "current")
      #  @user = current_user
      #else
        @user = User.find(params[:id])
      #end
      #

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :crypted_password, :password_confirmation, {:role_ids => []}, :first_name, :last_name, :lease_id)
    end
end
