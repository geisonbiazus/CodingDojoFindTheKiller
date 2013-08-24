require File.expand_path(File.dirname(__FILE__))+'/case'
require File.expand_path(File.dirname(__FILE__))+'/witness'
require File.expand_path(File.dirname(__FILE__))+'/detective'

# http://dojopuzzles.com/problemas/exibe/descubra-o-assassino/

class Game

	def initialize
		@case = Case.new
		@witness = Witness.new @case
		@detective = Detective.new(@case, @witness)

		puts "Starting the case..."
	end

	def resolve
		@detective.investigate

		message = ""
		@detective.history.each do |hist|			
			suspect = Case::SUSPECTS[hist[:question][0] - 1]
			weapon = Case::WEAPONS[hist[:question][1] - 1]
			place = Case::PLACES[hist[:question][2] - 1]
			message << "The detective asks witness if the victim was murdered by #{suspect} with #{weapon} in #{place}\n"
			if hist[:answer] != 0 
				message << "The witness answered that the murderer was not in #{place}\n" if hist[:answer] == 3
				message << "The witness answered that the murderer was not with a #{weapon}\n" if hist[:answer] == 2
				message << "The witness answered that the victim wasn't murdered by #{suspect}\n" if hist[:answer] == 1
			else
				message << "The witness answered that it was right\n" 
				message << "#{suspect} killed the victim with #{weapon} in #{place}" 
			end
			
		end
			puts message
	end

end