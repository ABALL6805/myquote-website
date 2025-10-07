json.extract! biography, :id, :biography, :quote_id, :author_id, :created_at, :updated_at
json.url biography_url(biography, format: :json)
