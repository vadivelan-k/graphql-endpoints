class Mutations::CreateModifierGroup < Mutations::BaseMutation
  argument :label, String, required: true
  argument :selection_required_min, Integer, required: true
  argument :selection_required_max, Integer, required: true

  field :modifier_group, Types::ModifierGroupType, null: true
  field :errors, [String], null: false

  def resolve(label:, selection_required_max:, selection_required_min:)
    modifier_group = ModifierGroup.create(
      label: label, selection_required_min: selection_required_min, selection_required_max: selection_required_max
    )

    if modifier_group.save
      { modifier_group: modifier_group, errors: [] }
    else
      { modifier_group: nil, errors: modifier_group.errors.full_messages }
    end
  end
end
