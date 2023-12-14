class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :redirect_if_signed_in

  private

  def redirect_if_signed_in
    if user_signed_in? && request.path == root_path
      redirect_to tasks_path
    end
  end
end
