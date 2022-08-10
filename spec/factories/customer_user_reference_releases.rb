FactoryBot.define do
  factory :customer_user_reference_release  do
    transient do
      user_reference { }
    end

    uref do
      create(:uref, :with_project, token: user_reference)
    end

  end
end
