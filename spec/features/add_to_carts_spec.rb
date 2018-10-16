require "rails_helper"

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "They can add to cart" do
    # ACT
    visit "/"
    # click_button "btn btn-primary"
    click_button "Add", match: :first

    # DEBUG / VERIFY
    puts page.html
    save_screenshot
    expect(page).to have_text "My Cart (1)"
  end
end
