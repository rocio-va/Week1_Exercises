class ProgrammingLanguage
	attr_accessor :name, :age, :type
	def initialize(name, age, type)
		@name = name
		@age = age
		@type = type
	end
	def to_s
		"Language: #{@name} | Age: #{@age} | Type System: #{@type}"
	end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

def array_printer(array)
	array.each do |language|
		puts "Language: #{language.name} | Age: #{language.age} | Type System: #{language.type}"
	end
end

aged_languages = array_of_languages.map do |language|
	new_language = language.clone
	new_language.age += 1
	new_language
end

sorted_languages = array_of_languages.sort do |language1, language2|
	language2.age <=> language1.age
end


array_printer(array_of_languages)
puts "------------------------"
array_printer(aged_languages)
puts "------------------------"
array_printer(sorted_languages)
#delete_if devuelve una referencia al array original
#no habría que guardarlo en la nueva variable
without_java = array_of_languages.delete_if{|language| language.name === "Java"}
puts "------------------------"
array_printer(without_java)
puts "------------------------"
array_printer(sorted_languages.shuffle)
=begin
(enumerable)reject devuelve un array con los elementos que devuelvan false en el bloque
=end
puts "------------------------"
array_printer(array_of_languages.reject{|language| language.age < 10})
=begin
drop coge los n elementos del array y devuelve un array con el resto
=end
puts "------------------------"
array_printer(array_of_languages.drop(2))
=begin
first devuelve el primer o los n primeros elementos de un array
=end
puts "------------------------"
array_printer(array_of_languages.first(2))
puts "------------------------"
puts array_of_languages.first