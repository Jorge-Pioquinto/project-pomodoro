# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :user
  has_many  :pomodoro_tasks, class_name: "PomodoroTask", foreign_key: "task_id", dependent: :destroy
end