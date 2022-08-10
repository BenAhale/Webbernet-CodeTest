class Prompt < ApplicationRecord
  enum status: { pending: 0 , complete: 1 }
  enum kind: {
         github_commit: 0 ,
         github_pull_request: 1,
         release_robot: 2,
         email: 3,
         submission_form: 4,
         public_form: 5
       }
  belongs_to :project
  belongs_to :form_prompt_subscription_reminder, optional: true
  has_many :releases
  has_one :commit
  has_one :email_prompt_detail
  belongs_to :internal_prompt_release, class_name: 'Release', foreign_key: 'internal_prompt_release_id', optional: true
  belongs_to :prompt_subscription, optional: true
end
