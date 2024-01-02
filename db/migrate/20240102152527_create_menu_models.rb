class CreateMenuModels < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.string  :label
      t.string  :state
      t.date    :start_date
      t.date    :end_date

      t.timestamps
    end

    create_table :sections do |t|
      t.string  :label
      t.string  :description
      t.integer :display_order

      t.timestamps
    end

    create_table :items do |t|
      t.string  :type
      t.string  :label
      t.string  :description
      t.decimal :price, precision: 10, scale: 2
    end

    create_table :modifier_groups do |t|
      t.string  :label
      t.integer :selection_required_min, default: 0
      t.integer :selection_required_max
    end

    create_join_table :menus, :sections do |t|
      t.integer :display_order, default: 0
    end

    create_join_table :sections, :items, table_name: 'sections_items' do |t|
      t.integer :display_order, default: 0
    end

    create_join_table :items, :modifier_groups do |t|
    end

    create_table :modifiers do |t|
      t.integer :display_order, default: 0
      t.integer :default_quantity, default: 0
      t.decimal :price_override, precision: 10, scale: 2
    end

    add_reference :modifiers, :item, foreign_key: true
    add_reference :modifiers, :modifier_group, foreign_key: true
  end
end
