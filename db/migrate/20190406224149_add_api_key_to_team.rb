class AddApiKeyToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :api_key, :string
  end
end
