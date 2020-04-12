class Tweet < ApplicationRecord
  belongs_to :user
  has_many :supercools

  mount_uploader :image, ImageUploader
end
