FactoryBot.define do
  factory :modifier_group do
    label { '10 inch pizza' }
    selection_required_min { 0 }
    selection_required_max { 10 }
  end
end
