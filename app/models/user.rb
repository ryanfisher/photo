class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :bucket

  has_many :photos
  has_many :albums

  def gravatar
    Digest::MD5.hexdigest(email.strip.downcase)
  end
end
