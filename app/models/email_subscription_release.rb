class EmailSubscriptionRelease < ApplicationRecord
  belongs_to :email_subscription
  belongs_to :release
end
