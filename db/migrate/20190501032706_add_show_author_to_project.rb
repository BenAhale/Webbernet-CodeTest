class AddShowAuthorToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :hide_author, :boolean, null: false, default: false
  end
end
