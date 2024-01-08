class Mutations::CreateItem < Mutations::BaseMutation
  argument :label, String, required: true
  argument :description, String, required: true
  argument :price, Float, required: true

  field :item, Types::ItemType, null: true
  field :errors, [String], null: false

  def resolve(label:, description:, price:)
    item = Item.create(label: label, description: description, price: price)

    if item.save
      { item: item, errors: [] }
    else
      { item: nil, errors: item.errors.full_messages }
    end
  end
end
