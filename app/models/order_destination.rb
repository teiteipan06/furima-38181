class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :country_id, :city, :banchi, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :banchi
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
  end

  validates :country_id, numericality: {other_than: 1, message: "must be other than 1"}    


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, country_id: country_id, city: city, banchi: banchi, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end