class Product < ApplicationRecord
  after_create :send_product

  def send_product
    message = self.attributes.except("id", "created_at", "updated_at")
    Publisher.publish(message)
  end
end
