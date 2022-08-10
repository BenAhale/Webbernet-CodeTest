module ProjectUsers
  class IndexFacade
    def initialize(params)
      @params = params
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    def users
      project.project_users.includes(:user).map(&:user)
    end

    def available_users
      project.team.users.reject { |user|  users.include? user }
    end

    def team
      project.team
    end
  end
end
