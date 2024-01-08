class Mutations::CreateModifier < Mutations::BaseMutation
  argument :item_id, Integer, required: false
  argument :display_order, Integer, required: false
  argument :price_override, Float, required: true

  field :modifier, Types::ModifierType, null: true
  field :errors, [String], null: false

  def resolve(price_override:, item_id:, display_order:)
    puts item_id, display_order, price_override
    item = Item.find_by_id(item_id)
    return { modifier: nil, errors: ['Invalid Item'] } if item.nil?

    modifier = Modifier.create(display_order: display_order, price_override: price_override, item_id: item_id)

    if modifier
      { modifier: modifier, errors: [] }
    else
      { modifier: nil, errors: modifier.errors.full_messages }
    end
  end
end
