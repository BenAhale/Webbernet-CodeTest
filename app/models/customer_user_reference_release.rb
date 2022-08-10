class CustomerUserReferenceRelease < ApplicationRecord
  belongs_to :release
  belongs_to :uref
end
