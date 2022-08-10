class SummaryRelease < ApplicationRecord
  belongs_to :summary
  belongs_to :release
end
