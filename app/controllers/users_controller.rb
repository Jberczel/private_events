class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      sign_in user
      redirect_to @user
    else
      render 'new'
    end    
  end

  def show
    @user = User.find(params[:id])
    @previous_events = current_user.previous_events
    @upcoming_events = current_user.upcoming_events

  end

  def index
      @users = User.all
  end

  private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end
