# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_02_152527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "type"
    t.string "label"
    t.string "description"
    t.decimal "price", precision: 10, scale: 2
  end

  create_table "items_modifier_groups", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "modifier_group_id", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "label"
    t.string "state"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus_sections", id: false, force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "section_id", null: false
    t.integer "display_order", default: 0
  end

  create_table "modifier_groups", force: :cascade do |t|
    t.string "label"
    t.integer "selection_required_min", default: 0
    t.integer "selection_required_max"
  end

  create_table "modifiers", force: :cascade do |t|
    t.integer "display_order", default: 0
    t.integer "default_quantity", default: 0
    t.decimal "price_override", precision: 10, scale: 2
    t.bigint "item_id"
    t.bigint "modifier_group_id"
    t.index ["item_id"], name: "index_modifiers_on_item_id"
    t.index ["modifier_group_id"], name: "index_modifiers_on_modifier_group_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "label"
    t.string "description"
    t.integer "display_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections_items", id: false, force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "item_id", null: false
    t.integer "display_order", default: 0
  end

  add_foreign_key "modifiers", "items"
  add_foreign_key "modifiers", "modifier_groups"
end
