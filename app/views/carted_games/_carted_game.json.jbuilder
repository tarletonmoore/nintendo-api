# json.extract! carted_game, :id, :created_at, :updated_at
# json.url carted_game_url(carted_game, format: :json)
json.id carted_game.id
json.user_id carted_game.user_id
json.game_id carted_game.game_id
json.quantity carted_game.quantity
json.order_id carted_game.order_id
json.status carted_game.status
json.game carted_game.game
