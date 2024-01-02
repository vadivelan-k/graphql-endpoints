require 'rails_helper'

RSpec.describe Section, type: :model do
  subject { create(:section) }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  describe 'validations and associations' do
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:description) }

    it 'should have valid associations' do
      expect(subject).to have_many(:menus_sections)
      expect(subject).to have_many(:menus).through(:menus_sections)
      expect(subject).to have_many(:sections_items)
      expect(subject).to have_many(:items).through(:sections_items)
    end
  end
end
