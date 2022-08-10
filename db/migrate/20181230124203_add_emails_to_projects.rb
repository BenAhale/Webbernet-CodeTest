class AddEmailsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :emails, :string
    add_column :projects, :branch, :string, default: 'master', null: false
  end
end
