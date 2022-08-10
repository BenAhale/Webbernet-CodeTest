class CreateCustomerUserReferenceReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_user_reference_releases do |t|
      t.string :user_reference
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
