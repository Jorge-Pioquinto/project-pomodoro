class CreatePomodoros < ActiveRecord::Migration[7.0]
  def change
    create_table :pomodoros do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :focus_time
      t.integer :break_time

      t.timestamps
    end
  end
end
