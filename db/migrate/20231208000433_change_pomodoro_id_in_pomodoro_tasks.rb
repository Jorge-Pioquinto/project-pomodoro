class ChangePomodoroIdInPomodoroTasks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :pomodoro_tasks, :pomodoro_id, true
  end
end
