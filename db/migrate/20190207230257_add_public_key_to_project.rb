class AddPublicKeyToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :public_key, :string, unique: true
    Project.all.each { |project| project.update(public_key: SecureRandom.hex(5)) }
  end
end
