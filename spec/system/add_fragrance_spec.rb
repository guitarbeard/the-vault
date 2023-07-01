require 'rails_helper'

describe "adds a fragrance", type: :system, js: true do
  it "allows adding fragrance to slot", driver: :selenium_chrome do
    visit "/"
    within "#slot-x0-y0" do
      choose "empty-slot"
    end
    fill_in "name", with: "smelly1"
    click_on "save"
    expect(page).to have_selector ".fragrance-link"

    fragrance = Fragrance.last
    expect(fragrance.name).to eq "smelly1"
    expect(fragrance.x).to eq 0
    expect(fragrance.y).to eq 0
  end
end