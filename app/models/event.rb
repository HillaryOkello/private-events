class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :registrations
  has_many :attendees, through: :registrations, source: :user

  scope :upcoming_events, -> { where('event_date >= ?', Time.now) }
  scope :previous_events, -> { where('event_date <  ?', Time.now) }
end
