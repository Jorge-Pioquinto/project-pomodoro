class ChangeCompletedDefaultInPomodoroTasks < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pomodoro_tasks, :completed, from: nil, to: false
  end
end
