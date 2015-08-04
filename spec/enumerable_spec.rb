require 'spec_helper'
require_relative '../enumerable'

describe "#my_each" do
	it "is the same as #each" do
		test_array = [1,5,3,6,8,3]
		num1 = 0
		num2 = 0
		test_array.my_each {|num| num1 += num }
		test_array.each {|num| num2 += num }
		expect(num1).to eq(num2)
	end
end

describe "#my_each_with_index" do
	it "is the same as #each_with_index" do
		test_array = [1,5,3,6,8,3]
		num1 = 0
		num2 = 0
		test_array.my_each_with_index {|num, index| num1 += (num + index) }
		test_array.each_with_index {|num, index| num2 += (num + index) }
		expect(num1).to eq(num2)
	end
end

describe "#my_select" do
	it "is the same as #select" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| input % 2 == 0}
		expect(test_array.select(&my_proc)).to eq(test_array.my_select(&my_proc))
		expect(test_array2.select(&my_proc)).to eq(test_array2.my_select(&my_proc))
	end
end

describe "#my_all?" do
	it "is the same as #all?" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| input % 2 == 0}
		expect(test_array.my_all?(&my_proc)).to eq(test_array.all?(&my_proc))
		expect(test_array2.my_all?(&my_proc)).to eq(test_array2.all?(&my_proc))
	end
end

describe "#my_any?" do
	it "is the same as #any?" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| (input+1) % 2 == 0}
		expect(test_array.my_any?(&my_proc)).to eq(test_array.any?(&my_proc))
		expect(test_array2.my_any?(&my_proc)).to eq(test_array2.any?(&my_proc))
	end
end

describe "#my_none?" do
	it "is the same as #none?" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| (input+1) % 2 == 0}
		expect(test_array.my_none?(&my_proc)).to eq(test_array.none?(&my_proc))
		expect(test_array2.my_none?(&my_proc)).to eq(test_array2.none?(&my_proc))
	end
end

describe "#my_count" do
	it "is the same as #count" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| (input+1) % 2 == 0}
		expect(test_array.my_count(&my_proc)).to eq(test_array.count(&my_proc))
		expect(test_array2.my_count(&my_proc)).to eq(test_array2.count(&my_proc))
		expect(test_array.my_count(3)).to eq(test_array.count(3))
		expect(test_array.my_count).to eq(test_array.count)
	end
end

describe "#my_map" do
	it "accepts a proc and can run a block" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| (input+1) % 2}
		expect(test_array.my_map(my_proc)).to eq([0,0,0,1,1,0])
		expect(test_array.my_map(my_proc) {|x| x += 1}).to eq([1,1,1,2,2,1])
	end
end

describe "#my_inject" do
	it "injects" do
		test_array = [1,5,3,6,8,3]
		test_array2 = [2,4,6,8]
		my_proc = Proc.new { |input| (input+1) % 2}
		expect(test_array.my_inject { |sum, n| sum + n}).to eq(26)
		expect(test_array.my_inject(1) { |product, n| product * n}).to eq(2160)
	end
end

describe "#multiply_els" do
	it "multiplies elements together" do
		expect([1,5,3,6,8,3].multiply_els).to eq(2160)
	end
end