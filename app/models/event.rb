class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :registrations
  has_many :attendees, through: :registations, source: :user
end
