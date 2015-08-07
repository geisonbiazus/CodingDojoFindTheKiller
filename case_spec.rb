require File.expand_path(File.dirname(__FILE__))+'/case'
require 'timeout'

describe Case do

	describe "on initialize" do
		it "should randomize the initial values when no one was given" do
			@case = Case.new
			(1..Case::SUSPECTS.count).include?(@case.guilty).should be_true
			(1..Case::WEAPONS.count).include?(@case.used_weapon).should be_true
			(1..Case::PLACES.count).include?(@case.place).should be_true
		end
	end


end
