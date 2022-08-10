class Summary < ApplicationRecord
  belongs_to :email_subscription
  has_many :summary_releases
  has_many :releases, through: :summary_releases
end
