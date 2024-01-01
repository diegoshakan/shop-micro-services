class CreateItem
  def self.execute(message)
    Product.find_or_create_by(message)
  end
end
