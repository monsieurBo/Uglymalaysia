class Authentication < ApplicationRecord
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    authentication = find_by(provider: auth.provider, uid: auth.uid)
    authentication = create(uid: auth.uid, provider: auth.provider) if authentication.nil?
    authentication.token = auth.credentials.token
    authentication.save
    authentication
  end

  def update_token(auth)
    self.token = auth.credentials.token
    self.save
  end




end
