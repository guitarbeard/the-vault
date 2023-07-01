require 'rails_helper'

RSpec.describe Fragrance, type: :model do
  describe 'upon saving' do
    it 'allows saving of record with unique x and y values' do
      fragrance = create :fragrance
      expect(fragrance).to be_persisted
    end

    it 'prevents saving of record with same x y values' do
      fragrance = create :fragrance, x: 1, y: 1
      expect { create :fragrance, x: 1, y: 1 }.to raise_error ActiveRecord::RecordNotUnique
    end
  end
end