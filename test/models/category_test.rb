require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save()
    @second_category = Category.new(name: "Sports")
    assert_not @second_category.valid?
  end

  test "name should not be too long" do
    @category.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end

  
end