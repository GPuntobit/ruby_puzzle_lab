class LevelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @levels = Level.includes(:user_progresses).order(:id)
  end

  def show
    @level = Level.find(params[:id])
    @blocks = @level.blocks.to_a.shuffle
    @completed = current_user.user_progresses.find_by(level: @level)&.completed?
    @hints = @level.hints.order(:hint_order)
    @next_level = Level.where("id > ?", @level.id).first
  end

  def check_solution
    @level = Level.find(params[:id])
    user_solution = normalize_code(params[:solution])
    expected_solution = normalize_code(@level.solution)
    success = user_solution == expected_solution

    current_user.user_progresses.find_or_initialize_by(level: @level).update!(completed: success)

    response_data = {
      success: success,
      message: success ? "Livello completato!" : "Riprova!"
    }

    if success
      next_level = Level.where("id > ?", @level.id).first
      if next_level
        response_data[:next_level_id] = next_level.id
        response_data[:next_level_title] = next_level.title
        response_data[:has_next_level] = true
      else
        response_data[:has_next_level] = false
        response_data[:message] = "Hai completato tutti i livelli! Congratulazioni!"
      end
    end

    render json: response_data
  end

  def get_hint
    @level = Level.find(params[:id])
    hint_index = params[:hint_index].to_i
    hints = @level.hints.order(:hint_order)

    if hint_index < hints.length
      hint = hints[hint_index]
      render json: {
        hint: hint.content,
        hint_index: hint_index + 1,
        has_more: hint_index + 1 < hints.length
      }
    else
      render json: { error: "No more hints available" }, status: :not_found
    end
  end

  private

  def normalize_code(code)
    code.to_s
        .gsub(/\r\n?/, "\n")
        .gsub(/\s+/, " ")
        .gsub(/"/, "'")
        .strip
  end
end
