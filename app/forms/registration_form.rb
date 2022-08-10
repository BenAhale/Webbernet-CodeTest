class RegistrationForm < BaseForm
  attribute :team_name
  attribute :email
  attribute :first_name
  attribute :last_name
  attribute :password
  attribute :confirm_password

  validate :email_not_taken
  validate :password_match

  validates_length_of :password, minimum: 6

  def email_not_taken
    return unless User.find_by(email: email.downcase)
    errors.add(:base, 'Sorry, it seems like you already have an account with us. That email is already used.')
  end

  def password_match
    return if password == confirm_password
    errors.add(:base, 'Your passwords do not match')
  end

  def persist
    Team.transaction do
      team = Team.create!(
        name: team_name
      )

      user = User.create!(
        email: email.downcase,
        password: password,
        first_name: first_name,
        last_name: last_name,
        super_user: true,
        team: team
      )
    end
  end
end
