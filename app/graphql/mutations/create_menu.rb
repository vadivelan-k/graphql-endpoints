class Mutations::CreateMenu < Mutations::BaseMutation
  argument :label, String, required: true
  argument :start_date, GraphQL::Types::ISO8601Date, required: true
  argument :end_date, GraphQL::Types::ISO8601Date, required: true
  argument :state, String, required: true

  field :menu, Types::MenuType, null: true
  field :errors, [String], null: false

  def resolve(label:, start_date:, end_date:, state:)
    menu = Menu.create(label: label, start_date: start_date, end_date: end_date, state: state)

    if menu.save
      { menu: menu, errors: [] }
    else
      { menu: nil, errors: menu.errors.full_messages }
    end
  end
end
