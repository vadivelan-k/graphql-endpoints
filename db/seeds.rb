# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |number|
  number += 1
  menu = Menu.create(
    label: "Menu-#{number}",
    state: "open",
    start_date: Date.today,
    end_date: Date.today + 7
  )

  sections = []
  3.times do |num|
    num += 1
    sections << Section.create(
      label: "Section -#{number}-#{num}", display_order: num,
      description: "Description for section goes here"
    )
  end

  menu.sections = sections
  menu.save!
end
