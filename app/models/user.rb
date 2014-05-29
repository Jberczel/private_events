class User < ActiveRecord::Base
  has_many :events, :foreign_key => :creator_id

  has_many :invites, :foreign_key => :attendee_id
  has_many :attended_events, :through => :invites


  before_create :create_remember_token

  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.past
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
