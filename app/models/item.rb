class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :shipping_cost
  belongs_to :condition

  validates :name, :description, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1, message: "category can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "condition can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "shipping_cost can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "prefecture can't be blank" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "scheduled_delivery can't be blank" }
end
