class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :description, :price, :image, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
