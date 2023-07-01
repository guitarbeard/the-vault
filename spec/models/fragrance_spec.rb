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

    it 'prevents saving of record with x value greater than 9' do
      expect { create :fragrance, x: 10 }.to raise_error ActiveRecord::RecordInvalid
      expect { create :fragrance, x: 9 }.not_to raise_error
    end

    it 'prevents saving of record with y value greater than 9' do
      expect { create :fragrance, y: 10 }.to raise_error ActiveRecord::RecordInvalid
      expect { create :fragrance, y: 9 }.not_to raise_error
    end

    it 'prevents saving of record with x value less than 0' do
      expect { create :fragrance, x: -1 }.to raise_error ActiveRecord::RecordInvalid
      expect { create :fragrance, x: 0 }.not_to raise_error
    end

    it 'prevents saving of record with y value less than 0' do
      expect { create :fragrance, y: -1 }.to raise_error ActiveRecord::RecordInvalid
      expect { create :fragrance, y: 0 }.not_to raise_error
    end
  end
end