module Projects
  class EmailHookFacade
    def initialize(params)
      @params = params
    end

    def run
      return unless email_hook_subscription
      Prompt.transaction do
        prompt = Prompt.create!(
          project: project,
          title: @params['subject'],
          body: @params['stripped-html'],
          kind: :email,
          status: :pending
        )

        EmailPromptDetail.create!(
          prompt: prompt,
          to: splitter(@params['To']),
          from: splitter(@params['From'])
        )
      end
    end

    private

    def splitter(string)
      string.split('<').last.split('>').first
    end

    def project
      @project ||= email_hook_subscription
                     .prompt_subscription
                     .project
    end

    def email_hook_subscription
      @github_hook_subscription ||= EmailPromptSubscription
                                      .joins(:prompt_subscription)
                                      .where('prompt_subscriptions.deleted = false')
                                      .find_by(
                                        email_prefix_token: @params['recipient'].split('@').first
                                      )
    end
  end
end
