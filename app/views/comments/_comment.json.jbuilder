json.extract! comment, :id, :body, :comment_category_id, :commenter_id, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
