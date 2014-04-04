require 'test_helper'

class AdminProductsTest < ActionDispatch::IntegrationTest

  # def test_create_subscription
  #   # get "/"
  #   # assert_response :success
  #   visit '/'
  #   assert page.has_content?("Find out when we go live")
  # end
  def test_manage
  # visit "/admin/products"
  #fill_in "Find out when we go live", with: 'test@example.com'
  # save_and_open_page
  # product = products(:hat)
  #within("tr#{product}-#{product.id}") do
  #  click_on "Edit"
  #end

  visit "/admin/products"
  click_on "New Product"
  fill_in "Name", with: "Awesome"
  fill_in "Price", with: "9.99"
  click_on "Save"
  # save_and_open_page
  # click_on "Create Product"
  click_on "Awesome"
  assert page.has_content?('9.99')
  click_on "Edit"
  fill_in "Price", with: "18.99"
  click_on "Save"
  click_on "Awesome"
  assert page.has_content?('18.99')
  click_on "Delete"
  refute page.has_content?('Awesome')
    #{}"Product #{product.id} was created")
  #page.match?(/Pagefail.*was created/)

  # click_on "Sign Up"
  # assert page.has_content?('Subscription was successfully created.')
  # assert_equal 'test@example.com', Subscription.last.email
end
end
#end
