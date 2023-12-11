# json.extract! user, :id, :created_at, :updated_at
# json.url user_url(user, format: :json)
json.id user.id
json.name user.name
json.email user.email
json.admin user.admin
json.favorites user.favorites.map do |favorite|
  json.partial! "favorites/favorite", favorite: favorite
end

