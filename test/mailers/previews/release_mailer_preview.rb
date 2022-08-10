class ReleaseMailerPreview < ActionMailer::Preview
  def digest
    @set = ReleaseSet.first
    ReleaseMailer.with(set: @set, releases: @releases).digest(@set.id, 'jeebn@test.com')
  end
end
