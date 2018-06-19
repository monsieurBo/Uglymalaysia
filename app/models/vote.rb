class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :article, optional: true, dependent: :destroy
end