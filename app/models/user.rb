class User < ApplicationRecord
  has_one :session
  has_many :events_created, foreign_key: :user_id, class_name: 'Event'
  has_many :registrations
  has_many :user_registrations, through: :registrations, source: :events

  validates :name, presence: true, uniqueness: true
end
