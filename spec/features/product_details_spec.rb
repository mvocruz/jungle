require 'rails_helper'

RSpec.feature "Visitor navigates to Product Details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

  end

  scenario "When a product is selected" do
    # ACT
    visit root_path

    # CLICK PRODUCT LINK
    click_on 'Details'

    # VERIFY HOME PAGE
    expect(page).to have_content 'Apparel'

    # DEBUG
    save_screenshot


  end
end