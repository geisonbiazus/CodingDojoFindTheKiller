require File.expand_path(File.dirname(__FILE__))+'/case'
require File.expand_path(File.dirname(__FILE__))+'/witness'
require File.expand_path(File.dirname(__FILE__))+'/detective'

# http://dojopuzzles.com/problemas/exibe/descubra-o-assassino/

class Game

	def initialize(person=nil,weapon=nil,place=nil)
		@case = Case.new(person,weapon,place)
		@witness = Witness.new @case
		@detective = Detective.new(@case, @witness)
	end

	def solution(person, weapon, place)
		@detective.solution(person, weapon, place)
	end

end