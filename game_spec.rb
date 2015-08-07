require File.expand_path(File.dirname(__FILE__))+'/game'

describe Game do

	describe 'on initialize' do
		it "should print the message 'Starting the case...'" do
			Game.any_instance.should_receive(:puts).with("Starting the case...")
			Game.new
		end
	end

	it "should initialize and resolve the case" do
		Game.any_instance.stub(:puts)
		@game = Game.new
		Detective.any_instance.should_receive(:investigate).and_call_original
		@game.resolve
	end

	it "should print the conversation and say that the place is wrong" do
		my_history = [{:question => [1, 1, 1], :answer => 3}, {:question => [1, 1, 4], :answer => 0}]
		@game = Game.new
		Detective.any_instance.should_receive(:history).twice.and_return(my_history)
		message = "The detective asks witness if the victim was murdered by Charles B. Abbage with Peixeira in Redmond\n"
		message << "The witness answered that the murder was not in Redmond\n"
		message << "The detective asks witness if the victim was murdered by Charles B. Abbage with Peixeira in Tokio\n"
		message << "The witness answered that it was right\n"
		message << "Charles B. Abbage killed the victim with Peixeira in Tokio\n"
		message << "The detective resolved the case in 2 tries"
		Game.any_instance.should_receive(:puts).with(message)
		@game.resolve
	end

	it "should print the conversation and say that the weapon is wrong" do
		my_history = [{:question => [1, 1, 1], :answer => 2}, {:question => [1, 1, 4], :answer => 0}]
		@game = Game.new
		Detective.any_instance.should_receive(:history).twice.and_return(my_history)
		message = "The detective asks witness if the victim was murdered by Charles B. Abbage with Peixeira in Redmond\n"
		message << "The witness answered that the murder was not with Peixeira\n"
		message << "The detective asks witness if the victim was murdered by Charles B. Abbage with Peixeira in Tokio\n"
		message << "The witness answered that it was right\n"
		message << "Charles B. Abbage killed the victim with Peixeira in Tokio\n"
		message << "The detective resolved the case in 2 tries"
		Game.any_instance.should_receive(:puts).with(message)
		@game.resolve
	end

	it "should print the conversation and say that the guilty is wrong" do
		my_history = [{:question => [1, 1, 1], :answer => 1}, {:question => [1, 1, 4], :answer => 0}]
		@game = Game.new
		Detective.any_instance.should_receive(:history).twice.and_return(my_history)
		message = "The detective asks witness if the victim was murdered by Charles B. Abbage with Peixeira in Redmond\n"
		message << "The witness answered that the victim wasn't murdered by Charles B. Abbage\n"
		message << "The detective asks witness if the victim was murdered by Charles B. Abbage with Peixeira in Tokio\n"
		message << "The witness answered that it was right\n"
		message << "Charles B. Abbage killed the victim with Peixeira in Tokio\n"
		message << "The detective resolved the case in 2 tries"
		Game.any_instance.should_receive(:puts).with(message)
		@game.resolve
	end

end
