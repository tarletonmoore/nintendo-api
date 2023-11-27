# json.extract! order, :id, :created_at, :updated_at
# json.url order_url(order, format: :json)
json.id order.id
json.user_id order.user_id
json.games order.games
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.carted_games @order.carted_games do |carted_game|
  json.id carted_game.id
  json.status carted_game.status
  json.quantity carted_game.quantity

  json.game do
    json.id carted_game.game.id
    json.title carted_game.game.title
    json.image carted_game.game.image
    json.price carted_game.game.price
  end
end
