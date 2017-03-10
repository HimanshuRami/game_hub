json.array!(@games) do |game|
  json.extract! game, :id, :name, :price, :category_id, :user_id
  json.url game_url(game, format: :json)
end
