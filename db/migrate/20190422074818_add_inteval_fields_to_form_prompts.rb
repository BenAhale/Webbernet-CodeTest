class AddIntevalFieldsToFormPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :form_prompt_subscriptions, :interval_type, :integer
    add_column :form_prompt_subscriptions, :interval_value, :integer
    add_column :form_prompt_subscriptions, :next_run, :integer
  end
end
