class Detective


	def initialize(the_case, witness)
		@case = the_case
		@witness = witness
	end

	def solution(person, weapon, place)
		@witness.ask(person, weapon, place)
	end
end