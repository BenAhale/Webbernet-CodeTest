class AddUniqueToProjectsPublicKey < ActiveRecord::Migration[5.2]
  def change
    add_index :projects, :public_key, unique: true
  end
end
