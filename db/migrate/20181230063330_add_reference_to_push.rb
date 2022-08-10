class AddReferenceToPush < ActiveRecord::Migration[5.2]
  def change
    add_reference :pushes, :release_set, foreign_key: true
  end
end
