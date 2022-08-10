module Releases
  class EditFacade
    def initialize(params)
      @params = params
    end

    def form
      ReleaseForm.new(release.attributes)
    end

    def project
      release.project
    end

    def presign_post
      PresignPostBuilder.new(acl: 'public-read').data_hash
    end

    def categories
      project.categories
    end

    def release
      Release.find_by(public_key: @params[:public_id])
    end

    def reads
      ReleaseRead.where(release_id: release.id).includes(:uref)
    end
  end
end
