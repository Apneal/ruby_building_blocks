def caesar_cipher(string, shift=5)
	#convert downshift to equivalent upshift
	shift = shift.to_i
	until (shift >= 0)
		shift = shift + 26
	end

	#shift each letter, keep case, ignore other characters
	newstring = ""
	string.to_s.each_char do |letter|
		case letter
		when /[A-Z]/
			newstring << char_shift(letter, "A".ord, shift)
		when /[a-z]/
			newstring << char_shift(letter, "a".ord, shift)
		else
			newstring << letter
		end
	end
	return newstring
end

def char_shift(char, ascii_start, shift)
	#convert letter to index 0-25
	char_index = char.ord - ascii_start

	#shift index, looped within range of 0-25
	char_index = (char_index + shift) % 26

	#convert index back to character
	char = (char_index + ascii_start).chr
end
