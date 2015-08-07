require File.expand_path(File.dirname(__FILE__))+'/detective'

describe Detective do

	before :each do
		the_case = Case.new(4, 1, 1)
		@witness = Witness.new(the_case)
		@detective = Detective.new(the_case, @witness)
	end

	it "should discover the guilty when the guilty is 4" do
		@detective.investigate.first.should == 4
	end

	it "should discover the guilty when the guilty is 2" do
		@detective.case.guilty = 2
		@detective.investigate.first.should == 2
	end

	it "should discover the weapon when the weapon is 2" do
		@detective.case.used_weapon = 2
		@detective.investigate[1].should == 2
	end

	it "should discover the place when the place is 4" do
		@detective.case.place = 4
		@detective.investigate.last.should == 4
	end

	it "should contain one history, after call investigate" do
		@detective.investigate
		@detective.history.count.should >= 1
	end

	it "should store question and answer in history, after call investigate" do
		@detective.investigate
		@detective.history.last[:question].should == [4, 1, 1]
		@detective.history.last[:answer].should == 0
	end
end
