json.extract! navigation, :id, :title, :is_visible, :can_create, :can_edit, :can_delete, :created_at, :updated_at
json.url navigation_url(navigation, format: :json)
