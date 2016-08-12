#user = "rocio"
#password = "f12h3"
class UserAutentication
	def self.autenticate_user(userAnswer, passwordAnswer)
		"rocio" == userAnswer && "rocio123" == passwordAnswer
	end
end

class Edit
	def self.count_words(text)
		array_words = text.split(" ")
		array_words.length
	end
	def self.count_letter(text)
		new_text = text.delete(" ")
		new_text.length
	end
	def self.reverse_text(text)
		text.reverse
	end
	def self.convert_uppercase(text)
		text.upcase
	end
	def self.convert_lowercase(text)
		text.downcase
	end
end

class TextWriter
	def login_in_textWriter
		print "Usuario: "
		userAnswer = gets.chomp
		print "Contraseña: "
		passwordAnswer = gets.chomp
		if(UserAutentication.autenticate_user(userAnswer, passwordAnswer))
			write_text
		else
			puts "Datos incorrectos."
			login_in_textWriter
		end
	end
	def print_options
		puts "\nQué quieres hacer?"
		puts "\tCW contar las palabras."
		puts "\tCL contar las letras."
		puts "\tRT revertir el texto."
		puts "\tUP convertir en mayúsculas."
		puts "\tLW convertir en minúsculas."
		puts "\tEXIT salir."
	end
	def write_text
		puts "Escribe un texto."
		text = gets.chomp
		exit = false
		while(!exit)
			print_options
			option = gets.chomp.upcase
			#Edit.methods
			#Menu.send.(option.to_sym, text)
			case option
				when "CW"
					puts "Has escrito #{Edit.count_words(text)} palabras."
				when "CL"
					puts "Has escrito #{Edit.count_letter(text)} letras (espacios no incluidos)."
				when "RT"
					puts "Tu texto revertido es: \n#{Edit.reverse_text(text)}"
				when "UP"
					puts "Tu texto convertido a mayúsculas es: \n#{Edit.convert_uppercase(text)}" 
				when "LW"
					puts "Tu texto convertido a minúsculas es: \n#{Edit.convert_lowercase(text)}"
				when "EXIT" 
					exit = true
				else
					puts "Opción incorrecta."
			end
		end
	end
end

text_writer = TextWriter.new
text_writer.login_in_textWriter