class Item < ApplicationRecord



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
end
