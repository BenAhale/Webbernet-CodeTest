class EmailSubscription < ApplicationRecord
  belongs_to :project
  enum kind: { schedule: 0 , instant: 1 }
  enum interval_type: { hours: 0, days: 1 , weeks: 2 }
  default_scope { where('email_subscriptions.active = true') }
end
