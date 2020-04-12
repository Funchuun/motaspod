class Tweet < ApplicationRecord
  belongs_to :user
  has_many :supercools
  has_many :cools

  mount_uploader :image, ImageUploader
end
