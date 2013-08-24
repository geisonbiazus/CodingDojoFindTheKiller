require File.expand_path(File.dirname(__FILE__))+'/witness'
require File.expand_path(File.dirname(__FILE__))+'/case'
require 'timeout'

describe Witness do

	describe 'when give person, weapon and place' do
		before :each do
			the_case = Case.new(1, 1, 1)
			@witness = Witness.new(the_case)
		end

		it "correctly must return 0" do
			@witness.answer(1, 1, 1).should == 0
		end

		it "should return 1 when guilty is wrong" do
			@witness.answer(2, 1, 1).should == 1
		end

		it "should return 2 when the weapon is wrong" do
			@witness.answer(1, 2, 1).should == 2
		end

		it "should return 3 when the place is wrong" do
			@witness.answer(1, 1, 2).should == 3
		end

		it "should return 1 or 2 when the guilty or the weapon is wrong" do
		# it "should return 1 or 2 when the guilty or the weapon are wrong" do -- is por causa do or
			guilty = false
			weapon = false

			Timeout::timeout(5){
				while !(guilty && weapon) do
					result = @witness.answer(2,2,1)
					guilty = true if result == 1
					weapon = true if result == 2
				end
			}
			(guilty && weapon).should == true
		end

		it "should return 2 or 3 when the weapon or the place is wrong" do
		# it "should return 2 or 3 when the weapon or the place are wrong" do
			weapon = false
			place = false

			Timeout::timeout(5){
				while !(weapon && place) do
					result = @witness.answer(1,2,5)
					weapon = true if result == 2
					place = true if result == 3
				end
			}
			(weapon && place).should == true
		end

		it "should return 1 or 3 when the person or the place is wrong" do
		# it "should return 1 or 3 when the person or the place are wrong" do
			person = false
			place = false

			Timeout::timeout(5){
				while !(person && place) do
					result = @witness.answer(3,1,5)
					person = true if result == 1
					place = true if result == 3
				end
			}
			(person && place).should == true
		end

		it "should return 1, 2 or 3 when the person, weapon or the place is wrong" do
		# it "should return 1, 2 or 3 when the person, weapon or the place are wrong" do
			person = false
			place = false
			weapon = false

			Timeout::timeout(5){
				while !(person && place && weapon) do
					result = @witness.answer(6,6,6)
					person = true if result == 1
					weapon = true if result == 2
					place = true if result == 3
				end
			}
			(person && weapon && place).should == true
		end
	end

end