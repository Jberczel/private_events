class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end    
  end

  def show
    @user = User.find(params[:id])
    @previous_events = @user.previous_events
    @upcoming_events = @user.upcoming_events

  end

  def index
      @users = User.paginate(page: params[:page])
  end

  private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end
