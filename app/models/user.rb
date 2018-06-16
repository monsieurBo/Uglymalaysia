class User < ApplicationRecord
  has_many :authentications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

    def self.create_with_omniauth(auth)

        user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
        user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
        user.password = auth[‘uid’]
        user.name = auth[‘info’][‘name’]
        if User.exists?(user)
          user
        else
          user.save!
          user
        end
    end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.create_with_auth_and_hash(authentication, auth_hash)
        user = self.create!(
          name: auth_hash["info"]["name"],
          email: auth_hash["info"]["email"],
          password: SecureRandom.hex(10)
        )
        user.authentications << authentication
        return user
  end

          # grab google to access google for user data
  def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
  end

  def twitter_token
        x = self.authentications.find_by(provider: 'twitter')
        return x.token unless x.nil?
  end


end
