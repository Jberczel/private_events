module EventsHelper

  def host?(user)
    current_user == user
  end
end
