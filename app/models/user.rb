class User < ApplicationRecord
  has_one :session
  has_many :events
  has_many :registrations
  has_many :user_registrations, through: :registrations, source: :events
  has_many :attended_events, through: :registrations

  validates :name, presence: true, uniqueness: true
end
