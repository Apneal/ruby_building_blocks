module Enumerable
	def my_each
		i=0
		while i < self.size
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i=0
		while i < self.size
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select
		new_array = []
		self.my_each do |input|
			new_array << input if yield(input)
		end
		return new_array
	end

	def my_all?
		self.my_select{|x| yield(x)} == self
	end

	def my_none?
		self.my_select{|x| yield(x)}.empty?
	end

	def my_any?
		!(self.my_none?{|x| yield(x)})
	end

	def my_count(match = nil)
		if block_given?
			return self.my_select{|x| yield(x)}.size 
		elsif !(match.nil?)
			return self.my_select{|x| x == match}.size
		else
			return self.size
		end
	end

	def my_map(proc)
		new_array = []
		self.my_each do |input|
			input = proc.call(input)
			if block_given?
				input = yield(input)
			end
			new_array << input
		end
		return new_array
	end

	def my_inject(i=0)
		self.my_each{ |input| i = yield(i, input)}
		return i
	end

	def multiply_els
		self.my_inject(1) {|product, n| product *= n }
	end
end