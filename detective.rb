class Detective

	attr_accessor :history, :case

	def initialize(the_case, witness)
		@case = the_case
		@witness = witness

		@history = []
	end

	def investigate

		Case::SUSPECTS.each_index do |suspect|
			Case::WEAPONS.each_index do |weapon|
				Case::PLACES.each_index do |place|
					return @history.last[:question] if self.ask(suspect+1, weapon+1, place+1) == 0
				end
			end
		end

	end

	def ask(person, weapon, place)
		@history << {question: [person, weapon, place], answer: @witness.answer(person, weapon, place)}
		@history.last[:answer]
	end
end
