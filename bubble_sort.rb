def bubble_sort(input)
	loop do
		i=true
		for j in (0..(input.length-2) )
			if (input[j] <=> input[j+1]) > 0
				i = false
				input[j], input[j+1] = input[j+1], input[j]
			end
		end
		break if i
	end
	return input
end
def bubble_sort_by(input)
	loop do
		i=true
		for j in (0..(input.length-2) )
			if (yield(input[j],input[j+1])) && (yield(input[j],input[j+1])) > 0
				i = false
				input[j], input[j+1] = input[j+1], input[j]
			end
		end
		break if i
	end
	return input
end