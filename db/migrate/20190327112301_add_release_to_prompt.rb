class AddReleaseToPrompt < ActiveRecord::Migration[5.2]
  def change
    add_reference :releases, :prompt, foreign_key: true
  end
end
