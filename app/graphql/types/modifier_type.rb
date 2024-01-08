# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Integer
    field :default_quantity, Integer
    field :price_override, Float
    field :item_id, Integer
    field :modifier_group_id, Integer
  end
end
