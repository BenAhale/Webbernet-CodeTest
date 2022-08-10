class ChangeDefaultOfStartsAt < ActiveRecord::Migration[5.2]
  def change
    EmailSubscription.where(start_from_release_id: nil).update_all(start_from_release_id: 0)
    change_column_default :email_subscriptions, :start_from_release_id, 0
    change_column_null :email_subscriptions, :start_from_release_id, false
  end
end
