class FeedBaseController < ApplicationController
  skip_before_action :require_login
  before_action :check_public_feed, :enable_footer, :check_valid_signature

  before_action :allow_iframe_embed

  def allow_iframe_embed
    response.headers.delete "X-Frame-Options"
  end

  def enable_footer
    @show_rr_footer = true
  end

  def attempting_sig_authentication
    params[:sig].present? || params[:uref].present?
  end

  def check_valid_signature
    return unless attempting_sig_authentication
    begin
      valid = ValidatePresignedProjectAccess.new(
        sig: params[:sig],
        project: project,
        expiry_seconds: params[:exp],
        generated_at: params[:gen],
        uref: params[:uref]
      ).run

      if valid
        return unless params[:fname].present? || params[:lname].present?
        UrefLocator.new(user_reference: params[:uref], project: project).run.update!(
          first_name: params[:fname],
          last_name: params[:lname]
        )

        return
      end

      bad_signature
    rescue ValidatePresignedProjectAccess::ExpiredLink
      link_expired
    end
  end

  def check_public_feed
    return project_no_exist unless project
    return if project.public_feed
    return if attempting_sig_authentication

    if logged_in?
      has_permission = UserPermissionToProject.new(project, @current_user).run
      access_denied unless has_permission
    else
      access_denied
    end
  end

  def access_denied
    error_page(et: 'RR003')
  end

  def project_no_exist
    error_page(et: 'RR004')
  end

  def link_expired
    error_page(et: 'RR002')
  end

  def bad_signature
    error_page(et: 'RR001')
  end

  def error_page(et:)
    session.delete(:return_to_url)
    redirect_to public_error_path(et: et)
  end

  def project
    Project.active.find_by(public_key: params[:p])
  end
end
