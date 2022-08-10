class AddCategoryToReleases < ActiveRecord::Migration[5.2]
  def change
    add_reference :releases, :category, foreign_key: true
  end
end
