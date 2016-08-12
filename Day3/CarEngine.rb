class Car
	def initialize engine, noise
		@engine = engine 
		@noise = noise
	end
	def make_noise
		puts "#{@noise}#{@engine.move_pistons}"
	end

end

class Engine
	def initialize noise
		@noise = noise
	end
	def move_pistons
		@noise
	end

end

engine1 = Engine.new("Brrrr")
engine2 = Engine.new("Brroo")
engine3 = Engine.new("Brroommm")
engine4 = Engine.new("Brraaamm")
car1 = Car.new(engine3, "Piiiiii")
car2 = Car.new(engine3, "Mec-mec")
car3 = Car.new(engine1, "Puuuuu")
car4 = Car.new(engine4, "Bruuum")

car1.make_noise
car2.make_noise
car3.make_noise
car4.make_noise

