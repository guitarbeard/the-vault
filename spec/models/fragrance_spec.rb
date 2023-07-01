require 'rails_helper'

RSpec.describe Fragrance, type: :model do
  describe 'upon saving' do
    it 'allows saving of record with unique x and y values' do
      fragrance = create :fragrance
      expect(fragrance).to be_persisted
    end
  end
end