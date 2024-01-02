class ModifierGroup < ApplicationRecord
  has_many :items_modifier_groups
  has_many :items, through: :items_modifier_groups
  has_many :modifiers

  validates :label, presence: true, length: { maximum: 150 }
end
