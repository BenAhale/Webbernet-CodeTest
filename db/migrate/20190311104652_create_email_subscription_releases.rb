class CreateEmailSubscriptionReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :email_subscription_releases do |t|
      t.references :email_subscription, foreign_key: true
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
