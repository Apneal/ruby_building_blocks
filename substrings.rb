def substrings(string, dictionary)
	word_count = {}
	string = string.downcase
	dictionary.each do |word|
		string.scan(word.downcase) do
			if word_count.has_key?(word)
				word_count[word] += 1
			else
				word_count[word] = 1
			end
		end	
	end
	return word_count
end