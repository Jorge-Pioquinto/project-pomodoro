class PomodorosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pomodoro, only: %i[ show edit update destroy ]

  # GET /pomodoros or /pomodoros.json
  def index
    if current_user
      @pomodoros = current_user.pomodoros
                               .joins(:pomodoro_tasks)
                               .where(pomodoro_tasks: { completed: false })
                               .order(created_at: :desc)
    end
  end

  # GET /pomodoros/1 or /pomodoros/1.json
  def show
  end

  # GET /pomodoros/new
  def new
    @pomodoro = Pomodoro.new(focus_time: 25, break_time: 5)
  end

  # GET /pomodoros/1/edit
  def edit
  end

  # POST /pomodoros or /pomodoros.json
  def create
    @pomodoro = current_user.pomodoros.build(pomodoro_params)

    respond_to do |format|
      if @pomodoro.save
        format.html { redirect_to pomodoros_path, notice: "Pomodoro was successfully created." }
        format.json { render :show, status: :created, location: @pomodoro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pomodoros/1 or /pomodoros/1.json
  def update
    respond_to do |format|
      if @pomodoro.update(pomodoro_params)
        format.html { redirect_to pomodoros_path, notice: "Pomodoro was successfully updated." }
        format.json { render :show, status: :ok, location: @pomodoro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1 or /pomodoros/1.json
  def destroy
    @pomodoro.destroy

    respond_to do |format|
      format.html { redirect_to pomodoros_url, notice: "Pomodoro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def timer
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pomodoro
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pomodoro_params
    params.require(:pomodoro).permit(:focus_time, :break_time, pomodoro_tasks_attributes: [:id, :task_id, :completed, :_destroy, task_attributes: [:id, :description]])
  end
end
