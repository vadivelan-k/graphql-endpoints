require 'rails_helper'

RSpec.describe Modifier, type: :model do
  subject { create(:modifier) }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  describe 'validations and associations' do
    it { should belong_to(:modifier_group) }
    it { should belong_to(:item) }
  end
end
