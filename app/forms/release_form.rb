class ReleaseForm < BaseForm
  attribute :title
  attribute :body
  attribute :html_body
  attribute :prompt_id
  attribute :project_id
  attribute :category_id
  attribute :status
  attribute :team_id
  attribute :user_id

  def persist
    release = Release.new(
      title: title,
      body: body,
      status: status,
      project_id: project_id,
      prompt_id: prompt_id,
      html_body: html_body,
      category_id: category_id,
      user_id: user_id
    )

    if prompt_id.present?
      prompt = Prompt.find(prompt_id)
      release.created_at = prompt.created_at
    end

    release.save!
  end
end
