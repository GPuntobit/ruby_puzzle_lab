class LevelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @levels = Level.includes(:user_progresses).order(:id)
  end

  def show
    @level = Level.find(params[:id])
    @blocks = @level.blocks.to_a.shuffle
    @completed = current_user.user_progresses.find_by(level: @level)&.completed?
  end

  def check_solution
    @level = Level.find(params[:id])
    user_solution = normalize_code(params[:solution])
    expected_solution = normalize_code(@level.solution)
    success = user_solution == expected_solution

    current_user.user_progresses.find_or_initialize_by(level: @level).update!(completed: success)

    render json: {
      success: success,
      message: success ? "Livello completato!" : "Riprova!"
    }
  end

  private

  def normalize_code(code)
    code.to_s
        .gsub(/\r\n?/, "\n")
        .gsub(/\s+/, ' ')
        .gsub(/"/, "'")
        .strip
  end
end
