require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@p = FactoryGirl.create(:product)
  	assert @p.valid?
  end

  test "must have a description" do
  	@p.description = ""
  	refute @p.valid?
  end

  test "must have a name" do
  	@p.name = ""
  	refute @p.valid?
  end

  test "price_in_cents must be an integer" do
  	@p.price_in_cents = 1.5
  	refute @p.valid?
  end

  test "must have a price_in_cents" do
  	@p.price_in_cents = nil
  	refute @p.valid?
  end

	
	test "must handle many decimal places price_in_dollars" do
  	@p.price_in_cents = nil
  	@p.price_in_dollars = "12.90123"

  	assert_equal 12.90, @p.price_in_dollars
  	assert_equal 1290, @p.price_in_cents
  	assert @p.valid?
	end


  test "must refute invalid price_in_dollars" do
  	@p.price_in_cents = nil
  	@p.price_in_dollars = "abc"

  	assert_equal nil, @p.price_in_dollars
  	refute @p.valid?
	end

end
