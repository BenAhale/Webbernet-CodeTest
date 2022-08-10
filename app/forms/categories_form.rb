class CategoriesForm < BaseForm
  attribute :title
  attribute :pid

  def persist
    project = Project.find_by(public_key: pid)
    Category.create(
      title: title,
      project: project
    )
  end
end
