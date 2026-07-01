class UserProgressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_progresses = current_user.user_progresses.includes(:level).order(created_at: :desc)
  end
end
