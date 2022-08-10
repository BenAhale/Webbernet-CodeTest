class AddPublicKeyToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :public_key, :string
    add_index :categories, :public_key, unique: true
    Category.all.each do |cat|
      cat.update(public_key: SecureRandom.hex(5))
    end
    change_column_null :categories, :public_key, false
  end
end
