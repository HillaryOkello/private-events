class User < ApplicationRecord
  has_one :session
  has_many :events, class_name: 'Event'
  has_many :registrations, through: :registations, source: :event
end
