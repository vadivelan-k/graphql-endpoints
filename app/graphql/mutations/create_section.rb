class Mutations::CreateSection < Mutations::BaseMutation
  argument :label, String, required: true
  argument :description, String, required: true
  argument :display_order, Integer, required: true

  field :section, Types::SectionType, null: true
  field :errors, [String], null: false

  def resolve(label:, description:, display_order:)
    section = Section.create(label: label, description: description, display_order: display_order)

    if section.save
      { section: section, errors: [] }
    else
      { section: nil, errors: section.errors.full_messages }
    end
  end
end
