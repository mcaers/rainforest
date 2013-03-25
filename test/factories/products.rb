

FactoryGirl.define do 
	
	factory :product do 
		name "MyString"
		description "MyText"
		price_in_cents 1000
	end	

	
	# factory :product do 
	# 	name "Shoes"
	# 	description "Nice patent white leather shoes"
	# 	price_in_cents 9900
	# end	

	#example_2
	# factory :cheap_product, :class => Product do
	# 	name "Book"
	# 	description "Has pictures"
	# 	price_in_cents 99
	# end

end
