class FeedSettingsForm < BaseForm
  attribute :public_feed
  attribute :project_id

  def persist
    Project.find(project_id).update(public_feed: public_feed)
  end
end
