require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "List of Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/products/new"

    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"

    click_on 'Create Product'

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end

  test "prevent user from creating product with no name" do
    login_as users(:george)
    visit "/products/new"
    product_count_before = Product.count

    # exercise:
    fill_in "product_tagline", with: "Change your life: Learn to code"
    click_on 'Create Product'

    # verify:
    assert_equal "/products", page.current_path
    assert_equal product_count_before, Product.count
  end
end
