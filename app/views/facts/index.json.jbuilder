json.array!(@facts) do |fact|
  json.extract! fact, :id, :title, :description, :url, :upvote, :downvote
  json.url fact_url(fact, format: :json)
end
