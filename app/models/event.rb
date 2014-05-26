class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  has_many :invites, :foreign_key => "attended_event_id"
  has_many :attendees, :through => :invites

  scope :past, -> { where("Date < ?", Date.today) }
  scope :upcoming, -> { where("Date >= ?", Date.today) }

end
