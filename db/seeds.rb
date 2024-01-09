# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear all items before seeding
Menu.delete_all

menu = Menu.create(
  label: "Pizza Menu",
  state: "open",
  start_date: Date.today,
  end_date: Date.today + 7
)

classic_pizza = Section.create(
  label: "Classic Pizzas", display_order: 1,
  description: "Description for section goes here"
)

menu.sections << classic_pizza 

# items for first section
margherita = Item.create(label: 'Margherita Pizza', description: 'Item desc goes here', price: 8.00)
american = Item.create(label: 'American Pizza', description: 'Item desc goes here', price: 7.00)
hot_honey = Item.create(label: 'Hot Honey Pizza', description: 'Item desc goes here', price: 6.00)

classic_pizza.items << margherita
classic_pizza.items << american
classic_pizza.items << hot_honey

pizza_size = ModifierGroup.create(label: 'Size of Pizza', selection_required_min: 1, selection_required_max: 1)
margherita.modifier_groups << pizza_size

ten_inch = Modifier.create(
  item_id: margherita.id, modifier_group_id: pizza_size.id, display_order: 0, default_quantity: 1,
  price_override: 2.50
)
twelve_inch = Modifier.create(
  item_id: margherita.id, modifier_group_id: pizza_size.id, display_order: 0, default_quantity: 1,
  price_override: 3.50
)
fourteen_inch = Modifier.create(
  item_id: margherita.id, modifier_group_id: pizza_size.id, display_order: 0, default_quantity: 1,
  price_override: 5.50
)

