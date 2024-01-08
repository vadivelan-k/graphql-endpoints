module Resolvers
  class MenuResolver < BaseResolver
    type Types::MenuType, null: false
    argument  :id, ID

    def resolve(id:)
      ::Menu.find(id)
    end
  end
end
