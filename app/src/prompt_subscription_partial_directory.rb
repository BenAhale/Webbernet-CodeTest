class PromptSubscriptionPartialDirectory < SimpleDelegator

  def self.wrap(collection)
    collection.map do |item|
      new(item)
    end
  end

  def render_partial_path
    case kind
    when 'github', 'github_pull_request', 'github_commit'
      {
        subscription_display: 'shared/prompts/indicator/github',
        prompt_display: 'shared/prompts/github'
      }
    when 'release_robot'
      {
        subscription_display: 'shared/prompts/indicator/release_robot',
        prompt_display: 'shared/prompts/release_robot'
      }
    when 'email'
      {
        subscription_display: 'shared/prompts/indicator/email',
        prompt_display: 'shared/prompts/email'
      }
    when 'submission_form'
      {
        subscription_display: 'shared/prompts/indicator/submission_form',
        prompt_display: 'shared/prompts/submission_form'
      }
    when 'public_form'
      {
        subscription_display: 'shared/prompts/indicator/public_form',
        prompt_display: 'shared/prompts/public_form'
      }
    end
  end

end
