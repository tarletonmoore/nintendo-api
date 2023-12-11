# json.extract! favorite, :id, :created_at, :updated_at
# json.url favorite_url(favorite, format: :json)
json.id favorite.id
json.user favorite.user
json.game favorite.game
