require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name returns a capitalized first and last name" do
    sap = User.new(first_name: "sap", last_name: "sapir")
    assert_equal "Sap Sapir", sap.full_name
  end

  test "#full_name should not crash if user first_name is nil" do
    sap = User.new(last_name: "sapir")
    assert_equal "Sapir", sap.full_name
  end
end
