# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
    #   argument :id, ID, required: true, description: "ID of the object."
    # end

    # def node(id:)
    #   context.schema.object_from_id(id, context)
    # end

    # field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
    #   argument :ids, [ID], required: true, description: "IDs of the objects."
    # end

    # def nodes(ids:)
    #   ids.map { |id| context.schema.object_from_id(id, context) }
    # end

    # field :menu, resolver: Resolvers::MenuResolver

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :menus, [Types::MenuType], null: false
    def menus
      Menu.all
    end

    field :menu, Types::MenuType, null: false do
      argument :id, ID, required: true
    end
    def menu(id:)
      Menu.find(id)
    end

    field :section, Types::SectionType, null: false do
      argument :id, ID, required: true
    end
    def section(id:)
      Section.find(id)
    end

    field :item, Types::ItemType, null: false do
      argument :id, ID, required: true
    end
    def item(id:)
      Item.find(id)
    end

    field :modifier_group, Types::ModifierGroupType, null: false do
      argument :id, ID, required: true
    end
    def modifier_group(id:)
      ModifierGroup.find(id)
    end
  end
end
