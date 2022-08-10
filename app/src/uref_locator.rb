class UrefLocator
  def initialize(project:, user_reference:)
    @project = project
    @user_reference = user_reference
  end

  def run
    uref = Uref.find_by(project: @project, token: @user_reference)
    unless uref
      uref = Uref.create(
        project: @project,
        token: @user_reference
      )
      MarkReleasesNotNew.new(uref: uref).run
    end

    uref
  end
end
