class InternalPromptSubscription < ApplicationRecord
  belongs_to :prompt_subscription
  belongs_to :project
  belongs_to :project_prompt_invitation_token
end
