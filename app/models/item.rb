class Item < ApplicationRecord
  has_many :sections_items
  has_many :sections, through: :sections_items
  has_many :items_modifier_groups
  has_many :modifier_groups, through: :items_modifier_groups

  validates :label, :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
