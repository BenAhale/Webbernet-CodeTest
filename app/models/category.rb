class Category < ApplicationRecord
  belongs_to :project
  before_create :generate_public

  def generate_public
    self.public_key = SecureRandom.hex(10)
  end
end
