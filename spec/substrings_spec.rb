require 'spec_helper'
require_relative '../substrings'

describe "#substrings" do
	it "outputs a hash" do
		dictionary = ["test"]
		string_count = substrings("test",dictionary)
		expect(string_count.class).to eq(Hash)
	end
	it "can count one word" do
		dictionary = ["test"]
		string_count = substrings("test",dictionary)
		string_count.should include("test" => 1)
		string_count.length.should be 1
	end
	it "is case insensitive" do
		dictionary = ["test"]
		string_count = substrings("teST",dictionary)
		string_count.should include("test" => 1)
		string_count.length.should be 1
	end
	it "can count multiple substrings" do
		dictionary = ["test","testing"]
		string_count = substrings("testing",dictionary)
		string_count.should include("test" => 1, "testing" => 1)
		string_count.length.should be 2
	end
	it "can count multiple input strings" do
		dictionary = ["below","down","go","going","horn","how",
			"howdy","it","i","low","own","part","partner","sit"]
		string_count = substrings("Howdy partner, sit down! How's it going?", dictionary)
		string_count.should include("down"=>1, "how"=>2, "howdy"=>1,"go"=>1,
			"going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1)
		string_count.length.should be 11
	end
end