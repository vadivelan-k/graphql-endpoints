class Modifier < ApplicationRecord
  # belongs_to  :modifier_group
  belongs_to  :item

  validates :price_override, numericality: { greater_than: 0 }
end
