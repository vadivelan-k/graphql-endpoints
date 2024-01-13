# frozen_string_literal: true

module Types
  class MenuSectionType < Types::BaseObject
    field :id, ID, null: false
    field :menu_id, Integer, null: false
    field :section_id, Integer, null: false
    field :display_order, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :section_label, String, null: false

    def section_label
      object.section.label
    end
  end
end
