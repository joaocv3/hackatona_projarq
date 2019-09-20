json.extract! student, :id, :name, :team_id, :course_id, :created_at, :updated_at
json.url student_url(student, format: :json)
