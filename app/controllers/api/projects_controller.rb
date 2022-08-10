module Api
  class ProjectsController < ApplicationController
    skip_before_action :require_login, only:[:home]
  end
end
