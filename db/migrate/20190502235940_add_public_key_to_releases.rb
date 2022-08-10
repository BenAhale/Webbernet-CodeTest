class AddPublicKeyToReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :public_key, :uuid, default: "gen_random_uuid()", null: false
    add_index :releases, :public_key, unique: true
  end
end
