require 'spec_helper'
require_relative '../bubble_sort'

describe "#bubble_sort" do
	it "sorts an array of intergers" do
		integers = [3,5,2,9,4,10,34,0,3]
		expect(bubble_sort(integers)).to eq(integers.sort)
	end
	it "sorts floating points" do
		floats = [4.643, 6.235, 78.34, 9.35, 2.463]
		expect(bubble_sort(floats)).to eq(floats.sort)
	end
	it "sorts an array of letters" do
		letters = %w(g a w t s w h)
		expect(bubble_sort(letters)).to eq(letters.sort)
	end
end

describe "#bubble_sort_by" do
	it "can arrange by string size" do
		expect(bubble_sort_by(["hi","hello","hey"]) do |left,right|
    		left.length - right.length
    	end).to eq(["hi", "hey", "hello"])
	end
end