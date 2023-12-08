# json.extract! game, :id, :created_at, :updated_at
# json.url game_url(game, format: :json)
json.id game.id
json.title game.title
json.image game.image
json.console_id game.console_id
json.console game.console
json.price game.price
json.reviews game.reviews do |review|
  json.id review.id
  json.game_id review.game_id
  json.review review.review
  json.user review.user
end