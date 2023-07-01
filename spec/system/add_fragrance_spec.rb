require 'rails_helper'

describe "adds a fragrance", type: :system, js: true do
  it "allows adding fragrance to slot", driver: :selenium_chrome do
    visit "/"
    within "#x0-y0" do
      choose ".fragrance-radio"
    end
  end
end