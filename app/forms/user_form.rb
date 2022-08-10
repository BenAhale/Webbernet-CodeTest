class UserForm < BaseForm
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :team_id

  def persist
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      team_id: team_id
    )
  end
end
