class SettingsForm < BaseForm
  attribute :title
  attribute :visibility
  attribute :hide_author
  attribute :pid

  def persist
    project = Project.find_by(public_key: pid)
    project.update(
      title: title,
      public_feed: visibility == 'Public',
      hide_author: hide_author
    )
  end
end
