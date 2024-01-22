# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :type, String
    field :label, String
    field :description, String
    field :price, Float

    field :modifiers, type: [Types::ModifierType], null: true
    field :modifier_groups, type: [Types::ModifierGroupType], null: true
    field :disabled, Boolean, null: false

    def disabled
      [true, false]. sample
    end
  end
end
