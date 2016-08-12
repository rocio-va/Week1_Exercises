class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
	    @city = city
	    @capacity = capacity
	    @price = price
	end
	def to_s
		"#{@name} in #{@city}\nPrice: $#{@price}"
	end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

def print_homes(array)
	array.each do |home|
		puts home
	end
end

cities = homes.map do |home|
	home.city
end

prices = homes.map do |home|
	home.price
end

print_homes(homes)
puts cities