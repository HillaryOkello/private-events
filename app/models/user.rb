class User < ApplicationRecord
  has_one :session
  has_many :events
  has_many :registrations
  has_many :user_registrations, through: :registrations
end
