# == Schema Information
#
# Table name: pomodoro_tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  pomodoro_id :integer          not null
#  task_id     :integer          not null
#
# Indexes
#
#  index_pomodoro_tasks_on_pomodoro_id  (pomodoro_id)
#  index_pomodoro_tasks_on_task_id      (task_id)
#
# Foreign Keys
#
#  pomodoro_id  (pomodoro_id => pomodoros.id)
#  task_id      (task_id => tasks.id)
#
class PomodoroTask < ApplicationRecord
  belongs_to :pomodoro
  belongs_to :task

  after_destroy :destroy_orphaned_pomodoro
  
  private

  def destroy_orphaned_pomodoro
    pomodoro.destroy if pomodoro.tasks.empty?
  end

end
