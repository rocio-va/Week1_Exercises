class ShoppingCart
	def initialize table_prices 
		@items = {}
		@table_prices = table_prices
	end
	def add_item_to_cart key
		if(@items.has_key?(key))
			@items[key] +=1
		else
			@items[key] = 1
		end
	end
	def show_items
		@items.each do |key, value|
			puts "#{value} #{key} #{@table_prices[key]*value}$"
		end
	end
	def cost
		units_to_pay = 0
		total_cost = @items.reduce(0) do |sum, (key, value)|
			if(key == :apple)
				units_to_pay = calc_discount_apple
			elsif (key == :orange)
				units_to_pay = calc_discount_orange
			elsif (key == :banana)
				units_to_pay = calc_discount_banana
			else
				units_to_pay = value
			end
			sum + units_to_pay*@table_prices[key]
		end
		puts "El coste total es de #{total_cost}$"
	end
	def calc_discount_apple
		@items[:apple] / 2 + @items[:apple] % 2
	end
	def calc_discount_orange
		@items[:orange] / 3 *2 + @items[:orange] % 3
	end
	def calc_discount_banana
		if(@items.has_key?(:grapes) && @items[:grapes] >= 4)
			if(@items[:grapes] / 4 >= @items[:banana])
				0
			else
				@items[:banana] - @items[:grapes] / 4
			end
		else
			@items[:banana]
		end

	end
	#if (key == :apple)
		#value = value / 2 + value % 2
end

prices = {apple: 10, orange: 5, grapes: 15, banana: 20, watermelon:50}
cart = ShoppingCart.new(prices)
cart.add_item_to_cart :orange
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :watermelon
cart.add_item_to_cart :banana

cart.show_items
cart.cost


