require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject { create(:menu) }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  describe 'validations and associations' do
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:state) }
    it { should validate_inclusion_of(:state).in_array(['open', 'close']) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }

    it 'should have valid associations' do
      expect(subject).to have_many(:menus_sections)
      expect(subject).to have_many(:sections).through(:menus_sections)
    end
  end
end
