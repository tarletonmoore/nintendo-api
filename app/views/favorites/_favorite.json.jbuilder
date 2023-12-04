# json.extract! favorite, :id, :created_at, :updated_at
# json.url favorite_url(favorite, format: :json)
json.user_id favorite.user_id
json.game_id favorite.game_id
json.game favorite.game
