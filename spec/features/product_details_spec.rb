require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see product details" do
    # ACT
    visit "/products/1"

    # DEBUG / VERIFY
    puts page.html
    save_screenshot
    expect(page).to have_text 'Quantity'
  end
end
