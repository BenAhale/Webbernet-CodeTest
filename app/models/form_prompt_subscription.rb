class FormPromptSubscription < ApplicationRecord
  belongs_to :prompt_subscription
  has_one :project, through: :prompt_subscription
  has_many :form_prompt_subscription_reminders
  enum interval_type: EmailSubscription.interval_types
end
