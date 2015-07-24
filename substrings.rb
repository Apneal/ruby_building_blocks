def substrings(input_string, dictionary)
	string_count = {}
	dictionary.each do |dictionary_word|
		input_string.downcase.scan(dictionary_word.downcase) do
			if string_count.has_key?(dictionary_word)
				string_count[dictionary_word] += 1
			else
				string_count[dictionary_word] = 1
			end
		end	
	end
	return string_count
end