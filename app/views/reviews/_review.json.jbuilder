# json.extract! review, :id, :created_at, :updated_at
# json.url review_url(review, format: :json)
json.id review.id
json.user_id review.user_id
json.game_id review.game_id
json.review review.review