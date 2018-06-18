class User < ApplicationRecord
  has_many :authentications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable , :confirmable

  def self.from_omniauth(authentication, auth)
    user = self.create!(
      email: auth.info.email,
      password: Devise.friendly_token[0,20],
      name: auth.info.name,   # assuming the user model has a name
    )
    user.authentications << authentication
    user
  end

end
