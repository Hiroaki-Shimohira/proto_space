class User < ActiveRecord::Base
	has_many :prototypes
	has_many :comments
	mount_uploader :avatar, ImageUploader

	validates :nickname, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
