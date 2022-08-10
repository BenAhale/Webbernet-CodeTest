class CreateUrefs < ActiveRecord::Migration[5.2]
  def change
    create_table :urefs do |t|
      t.string :token, null: false
      t.string :first_name
      t.string :last_name
      t.references :project, foreign_key: true, null: false

      t.timestamps
    end

    add_index :urefs, [:token, :project_id], unique: true
    add_reference :customer_user_reference_releases, :uref

    CustomerUserReferenceRelease.where(user_reference: nil).destroy_all

    CustomerUserReferenceRelease.select("DISTINCT ON (user_reference) *").includes(:release).each do |ref|
      release = Release.unscoped.find(ref.release_id)
      uref = Uref.create(token: ref.user_reference, project_id: release.project_id)
      CustomerUserReferenceRelease.where(user_reference: ref.user_reference).update_all(
        uref_id: uref.id
      )
    end

    change_column_null :customer_user_reference_releases, :uref_id, false
    remove_column :customer_user_reference_releases, :user_reference
  end
end
