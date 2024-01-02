require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item) }

  describe 'validations and associations' do
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }

    it 'should have valid associations' do
      expect(subject).to have_many(:sections_items)
      expect(subject).to have_many(:sections).through(:sections_items)
      expect(subject).to have_many(:items_modifier_groups)
      expect(subject).to have_many(:modifier_groups).through(:items_modifier_groups)
    end
  end
end
