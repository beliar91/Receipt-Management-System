json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :street, :city, :email, :telephone
  json.url shop_url(shop, format: :json)
end
