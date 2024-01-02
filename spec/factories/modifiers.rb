FactoryBot.define do
  factory :modifier do
    display_order { 0 }
    default_quantity { 0 }
    price_override { 12.0 }

    association :item, factory: :item
    association :modifier_group, factory: :modifier_group
  end
end
