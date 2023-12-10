json.extract! pomodoro_task, :id, :pomodoro_id, :task_id, :completed, :created_at, :updated_at
json.url pomodoro_task_url(pomodoro_task, format: :json)
