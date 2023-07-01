class Fragrance < ApplicationRecord
  MAX_X = 9
  MAX_Y = 9
  MIN_X = 0
  MIN_Y = 0
  validates :x, numericality: { less_than_or_equal_to: MAX_X, greater_than_or_equal_to: MIN_X }
  validates :y, numericality: { less_than_or_equal_to: MAX_Y, greater_than_or_equal_to: MIN_Y }
end
