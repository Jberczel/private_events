class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      @previous_events = @user.previous_events
      @upcoming_events = @user.upcoming_events
    end
  end

  def about
  end
end
