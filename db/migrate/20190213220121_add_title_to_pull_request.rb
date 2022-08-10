class AddTitleToPullRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :pull_requests, :title, :text
    add_column :pull_requests, :body, :text
  end
end
