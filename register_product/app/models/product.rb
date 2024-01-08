# frozen_string_literal: true

class Product < ApplicationRecord
  after_create :send_product

  def send_product
    message = attributes.except("id", "created_at", "updated_at")
    Publisher.publish(message)
  end
end
