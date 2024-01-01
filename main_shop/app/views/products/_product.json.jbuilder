json.extract! product, :id, :name, :description, :color, :unity, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
