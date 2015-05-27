json.array!(@entries) do |entry|
  json.extract! entry, :content, :user_id
  json.url entry_url(entry, format: :json)
end