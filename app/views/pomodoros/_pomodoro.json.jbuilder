json.extract! pomodoro, :id, :user_id, :focus_time, :break_time, :created_at, :updated_at
json.url pomodoro_url(pomodoro, format: :json)
