class FormPromptSubscriptionReminder < ApplicationRecord
  belongs_to :form_prompt_subscription
  before_create :generate_public

  def generate_public
    self.public_key = SecureRandom.hex(5)
  end
end
