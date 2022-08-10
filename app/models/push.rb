class Push < ApplicationRecord
  enum status: [:not_released, :released, :discarded]
  belongs_to :project
  belongs_to :pull_request, optional: true, class_name: 'PullRequest', primary_key: 'sha', foreign_key: 'sha'
  has_many :releases
end
