class CreatePomodoroTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :pomodoro_tasks do |t|
      t.references :pomodoro, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
