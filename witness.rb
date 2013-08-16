class Witness

	def initialize(the_case)
		@case = the_case
	end

	def ask(person, weapon, place)

		result = []

		result << 1 unless person == @case.guilty
		result << 2 unless weapon == @case.used_weapon
		result << 3 unless place == @case.place

		return result.empty? ? 0 : result[Random.rand(0..result.count-1)]
	end
end