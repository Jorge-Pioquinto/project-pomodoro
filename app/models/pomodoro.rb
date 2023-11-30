# == Schema Information
#
# Table name: pomodoros
#
#  id         :integer          not null, primary key
#  break_time :integer
#  focus_time :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_pomodoros_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Pomodoro < ApplicationRecord
  belongs_to :user
  has_many  :pomodoro_tasks, class_name: "PomodoroTask", foreign_key: "pomodoro_id", dependent: :destroy
end
