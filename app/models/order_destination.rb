class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :country_id, :city, :banchi, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :banchi
    validates :phone_number
    validates :order_id
    validates :token
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :country_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destinnation.create(post_code: post_code, country_id: country_id, city: city, banchi: banchi, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end