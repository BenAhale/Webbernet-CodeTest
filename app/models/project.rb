class Project < ApplicationRecord
  has_many :prompts
  has_many :prompt_subscriptions
  has_many :email_subscriptions
  has_many :releases
  has_many :project_users
  has_many :categories
  before_create :generate_public
  belongs_to :team

  scope :active, -> { where('projects.active = true') }

  def generate_public
    self.public_key = SecureRandom.hex(10) if !self.public_key
  end

end
