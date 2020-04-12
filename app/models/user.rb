class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :supercools
  has_many :cools
  def already_supercools?(tweet)
    self.supercools.exists?(tweet_id: tweet.id)
  end

  def already_cools?(tweet)
    self.cools.exists?(tweet_id: tweet.id)
  end
end
