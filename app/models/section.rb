class Section < ApplicationRecord
  has_many :menus_sections
  has_many :menus, through: :menus_sections
  has_many :sections_items
  has_many :items, through: :sections_items

  validates :label, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :display_order, numericality: { greater_than_or_equal_to: 0 }
end
