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

ten_inch = Item.create(label: "10'", description: '10 inch pizza', price: 1.50)
twelve_inch = Item.create(label: "12'", description: '12 inch pizza', price: 2.50)
fourteen_inch = Item.create(label: "14'", description: '14 inch pizza', price: 3.50)

Modifier.create(
  item_id: ten_inch.id, modifier_group_id: pizza_size.id, display_order: 0, default_quantity: 1,
  price_override: 2.50
)
Modifier.create(
  item_id: twelve_inch.id, modifier_group_id: pizza_size.id, display_order: 0, default_quantity: 1,
  price_override: 3.50
)
Modifier.create(
  item_id: fourteen_inch.id, modifier_group_id: pizza_size.id, display_order: 0, default_quantity: 1,
  price_override: 5.50
)

crust_type = ModifierGroup.create(label: 'Crust type', selection_required_min: 0, selection_required_max: 1)
american.modifier_groups << crust_type

cheese_crust = Item.create(label: "Cheese Crust", description: 'cheese crust', price: 2.0)
thin_crust = Item.create(label: "Thin Crust", description: 'thin crust', price: 0.0)

Modifier.create(
  item_id: cheese_crust.id, modifier_group_id: crust_type.id, display_order: 0, default_quantity: 1,
  price_override: 2.0
)
Modifier.create(
  item_id: thin_crust.id, modifier_group_id: crust_type.id, display_order: 0, default_quantity: 1,
  price_override: 0.0
)

bubble_tea_menu = Menu.create(label: 'Bubble Tea Menu', state: 'open', start_date: Date.today, end_date: Date.today + 7)
milk_tea = Section.create(label: 'Milk tea', display_order: 1, description: 'Description for milk tea goes here')
bubble_tea_menu.sections << milk_tea

# items 
bubble_tea = Item.create(label: 'Bubble Tea', description: 'Bubble tea description here', price: 5.50)
chocolate_tea = Item.create(label: 'Chocolate Tea', description: 'Chocolate tea description here', price: 5.50)
caramel_tea = Item.create(label: 'Caramel Tea', description: 'Caramel tea description here', price: 5.50)

milk_tea.items << bubble_tea
milk_tea.items << chocolate_tea
milk_tea.items << caramel_tea

sugar_level = ModifierGroup.create(label: 'Sugar Level', selection_required_min: 1, selection_required_max: 1)
bubble_tea.modifier_groups << sugar_level

no_sugar = Modifier.create(item_id: bubble_tea.id, modifier_group_id: sugar_level.id, price_override: 0)
half_sugar = Modifier.create(item_id: bubble_tea.id, modifier_group_id: sugar_level.id, price_override: 0)
full_sugar = Modifier.create(item_id: bubble_tea.id, modifier_group_id: sugar_level.id, price_override: 0)

size_modifier = ModifierGroup.create(label: 'Size', selection_required_min: 1, selection_required_max: 1)
bubble_tea.modifier_groups << size_modifier

small_size = Modifier.create(item_id: bubble_tea.id, modifier_group_id: size_modifier.id, price_override: 0.5)
medium_size = Modifier.create(item_id: bubble_tea.id, modifier_group_id: size_modifier.id, price_override: 1.5)
large_size = Modifier.create(item_id: bubble_tea.id, modifier_group_id: size_modifier.id, price_override: 2.0)

