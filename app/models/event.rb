class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :registrations
  has_many :attendees, through: :registrations, source: :user

  scope :upcoming_events, -> { where('date >= ?', Time.now) }
  scope :previous_events, -> { where('date <  ?', Time.now) }

  validates :date, presence: true
  validates :name, presence: true
end
