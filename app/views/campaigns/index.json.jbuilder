json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :user_id, :title, :goal, :pledged, :status, :end_at
  json.url campaign_url(campaign, format: :json)
end
