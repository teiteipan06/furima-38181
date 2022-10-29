class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :country_id
      validates :days_to_ship_id
    end
  end

  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :country
  belongs_to :days_to_ship
end
