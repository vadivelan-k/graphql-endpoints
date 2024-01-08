# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::CreateMenu
    field :create_section, mutation: Mutations::CreateSection
    field :create_item, mutation: Mutations::CreateItem
    field :create_modifier, mutation: Mutations::CreateModifier
    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
    field :assign_section_under_menu, mutation: Mutations::AssignSectionUnderMenu
  end
end
