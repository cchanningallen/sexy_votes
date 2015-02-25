json.array!(issues) do |issue|
  json.extract! issue, :id, :name, :type, :user_id, :team_id
  json.url issue_url(issue, format: :json)
end
