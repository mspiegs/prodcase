json.array!(@features) do |feature|
  json.extract! feature, :id, :title, :mentions
  json.url feature_url(feature, format: :json)
end
