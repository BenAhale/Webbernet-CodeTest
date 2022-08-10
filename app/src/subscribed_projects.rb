class SubscribedProjects
  def initialize(project)
    @project = project
  end

  def run
    projects = InternalPromptSubscription
      .where(project_id: @project.id)
      .joins(:prompt_subscription)
      .where('prompt_subscriptions.deleted = false')
      .map(&:prompt_subscription).map(&:project)
      .compact

    projects.reject { |project| !project.active }
  end
end
