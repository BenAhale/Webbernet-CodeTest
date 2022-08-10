class AddInternvalsToEmailSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :email_subscriptions, :next_run, :integer
    add_column :email_subscriptions, :interval_type, :integer
    add_column :email_subscriptions, :interval_value, :integer
    add_column :email_subscriptions, :kind, :integer, default: 0, null: false

    EmailSubscription.all.update_all(
      next_run: 1555628400,
      interval_type: :days,
      interval_value: 7
    )
  end
end
