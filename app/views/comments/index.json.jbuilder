json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment, :customer_id, :ticket_id, :user_id
  json.url comment_url(comment, format: :json)
end
