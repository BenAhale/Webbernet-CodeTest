class User < ApplicationRecord
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation
  belongs_to :team

  def full_name
    "#{first_name} #{last_name}"
  end
end
