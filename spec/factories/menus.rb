FactoryBot.define do
  factory :menu do
    label { 'Pizza Menu' }
    state { 'open' }
    start_date { Date.today }
    end_date { Date.today + 7 }
  end
end
