class Listing < ApplicationRecord
	belongs_to :users
	has_many :reservations
	has_many :users, through: :reservation
	mount_uploader :avatar, AvatarUploader
end
