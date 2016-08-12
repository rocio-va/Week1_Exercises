class Car
	attr_reader :cities
	def initialize(sound)
		@sound = sound
		@cities = []
	end
	def make_noise()
		puts @sound
	end
	def visit_city(city)
		@cities.push(city)
		#IO.write("cities.txt", @cities.join)
	end
	def self.speed_control()
		puts "Velocidad: "
		speed = gets.chomp.to_i
		if(speed > 100)
			puts "Tu velocidad es de #{speed}. Deberías ir más despacio"
		end
	end
	#def load_cities
	#	IO.read("cities.txt")
	#end
	#def cities()
	#	@cities = load_cities
	#end
end

class RacingCar < Car
	def initialize
		@sound = "BROOOM"
	end
end

my_car = Car.new("Brooom!")
my_car.make_noise()
my_car_2 = Car.new("Bruuum!")
my_car_2.make_noise()
my_car.visit_city("Roma")
my_car.visit_city("Salamanca")
my_car.visit_city("Londres")
puts(my_car.cities)

my_rc = RacingCar.new()
my_rc.make_noise


#Car.speed_control

class Person
	attr_reader :name
	def initialize(name, age)
		@name = name
		@age = age
	end
end
