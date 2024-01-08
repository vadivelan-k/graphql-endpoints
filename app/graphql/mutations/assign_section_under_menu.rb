class Mutations::AssignSectionUnderMenu < Mutations::BaseMutation
  argument :menu_id, Integer, required: true
  argument :section_id, Integer, required: true

  field :error, String, null: false
  field :menu_section, Types::MenuSectionType, null: true

  def resolve(menu_id:, section_id:)
    menu = Menu.find_by_id(menu_id)
    section = Section.find_by_id(section_id)

    return { error: 'Invalid Menu' } if menu.nil?
    return { error: 'Invalid Section' } if section.nil?

    menu.sections << section
    menu_section = menu.sections.find_by(section_id: section_id)

    if menu_section
      { menu_section: menu_section, error: '' }
    else
      { menu_section: nil, error: 'Issue occured when assigning section under menu' }
    end
  rescue

  end
end
