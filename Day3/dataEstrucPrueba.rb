# hash = {
# 	wat: [ 0, 1, {wat: "hola", wut: [7, [[0, 1, 2, 3, 4, 5, 6, 7, 8, {wat: 7, bbq: "hash"}] ,"hola"]]}]
# }

# arr = [
# 	[0, 1, 2, 3, 4, {wut: true, secret: {unlock: ["hola", "arr"]}}]
# ]

# puts hash[:wat][2][:wut][1][0][9][:bbq]

# puts arr[0][5][:secret][:unlock][1]

class CarDealer
	def initialize
		@array_cars = {}
	end
	def cars brand

	end
	def add_car (car)
		brand = car.brand
		if(@array_cars.has_key?(brand.to_sym))
			@array_cars[brand.to_sym] << car.model
		else
			@array_cars[brand.to_sym] = []
			@array_cars[brand.to_sym] << car.model
		end
	end
	def cars (brand)
		if(@array_cars.has_key?(brand.to_sym))
			@array_cars[brand.to_sym]
		else
			puts "No hay ningún coche de esa marca."
		end
	end
end

class Car
	attr_reader :brand, :model
	def initialize brand, model
		@brand = brand #marca
		@model = model
	end
end

car_dealer = CarDealer.new

car1 = Car.new "Ford", "Fiesta"
car2 = Car.new "Ford", "Mustang"
car3 = Car.new "Honda", "Civic"
car4 = Car.new "Honda", "CR-V"

car_dealer.add_car(car1)
car_dealer.add_car(car2)
car_dealer.add_car(car3)
car_dealer.add_car(car4)

puts "-------------------------"
puts "Ford"
puts car_dealer.cars("Ford")
puts "-------------------------"
puts "Toyota"
puts car_dealer.cars("Toyota")
puts "-------------------------"

