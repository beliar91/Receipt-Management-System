json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :shopping_date, :article, :brand, :shop
  json.url receipt_url(receipt, format: :json)
end
