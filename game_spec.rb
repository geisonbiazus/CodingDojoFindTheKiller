require File.expand_path(File.dirname(__FILE__))+'/game'
require 'timeout'

describe Game do


	describe 'when give person, weapon and place' do
		before :each do
			@game = Game.new(1,1,1)
		end

		it "correctly must return 0" do
			@game.solution(1, 1, 1).should == 0
		end

		it "should return 1 when guilty is wrong" do
			@game.solution(2, 1, 1).should == 1
		end

		it "should return 2 when the weapon is wrong" do
			@game.solution(1, 2, 1).should == 2
		end

		it "should return 3 when the place is wrong" do
			@game.solution(1, 1, 2).should == 3
		end

		it "should return 1 or 2 when the guilty or the weapon are wrong" do
			guilty = false
			weapon = false

			Timeout::timeout(5){
				while !(guilty && weapon) do
					result = @game.solution(2,2,1)
					guilty = true if result == 1
					weapon = true if result == 2
				end
			}
			(guilty && weapon).should == true
		end

		it "should return 2 or 3 when the weapon or the place are wrong" do
			weapon = false
			place = false

			Timeout::timeout(5){
				while !(weapon && place) do
					result = @game.solution(1,2,5)
					weapon = true if result == 2
					place = true if result == 3
				end
			}
			(weapon && place).should == true
		end

		it "should return 1 or 3 when the person or the place are wrong" do
			person = false
			place = false

			Timeout::timeout(5){
				while !(person && place) do
					result = @game.solution(3,1,5)
					person = true if result == 1
					place = true if result == 3
				end
			}
			(person && place).should == true
		end

		it "should return 1, 2 or 3 when the person, weapon or the place are wrong" do
			person = false
			place = false
			weapon = false

			Timeout::timeout(5){
				while !(person && place && weapon) do
					result = @game.solution(6,6,6)
					person = true if result == 1
					weapon = true if result == 2
					place = true if result == 3
				end
			}
			(person && weapon && place).should == true
		end
	end
end