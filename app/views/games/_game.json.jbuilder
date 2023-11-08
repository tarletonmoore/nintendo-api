# json.extract! game, :id, :created_at, :updated_at
# json.url game_url(game, format: :json)
json.id game.id
json.title game.title
json.image game.image
json.console_id game.console_id
