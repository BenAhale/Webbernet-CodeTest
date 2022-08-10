class Release < ApplicationRecord
  default_scope { where('active = true') }
  enum status: [:draft, :published]
  has_one :push
  belongs_to :category, optional: true
  belongs_to :project
  belongs_to :user
end
