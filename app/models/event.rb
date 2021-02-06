class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :registrations
  has_many :attendees, through: :registrations

  scope :upcoming_events, -> { where('date >= ?', Time.now) }
  scope :previous_events, -> { where('date <  ?', Time.now) }
end
