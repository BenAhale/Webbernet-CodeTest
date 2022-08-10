class PromptSubscription < ApplicationRecord
  belongs_to :project
  has_one :github_prompt_subscription
  has_one :internal_prompt_subscription
  has_one :email_prompt_subscription
  has_one :form_prompt_subscription
  enum kind: { release_robot: 0, github: 1, email: 2, submission_form: 3, public_form: 4 }

  scope :active, -> { where('prompt_subscriptions.deleted = false') }
end
