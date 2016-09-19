class Piglatin

	attr_writer :sentence	

	def initialize(sentence)
		@sentence = sentence
	end

	public
		def phrase()
			return @sentence
		end	

	private
		#This function returns the translation of the word in piglatin language
		def translateWord(englishWord)
			pigLatinWord = ""

			#Fisrt letter of the word
			firstLetter = englishWord[0]

			vowels = "aeiou"

			#Conditionals to test
			isCapitalized = firstLetter == firstLetter.upcase
			startsWithVowel = vowels.include? firstLetter.downcase

			if(startsWithVowel)

				#Last letter of the word
				lastLetter = englishWord[-1]

				#Conditionals to test
				endsWithVowel = vowels.include? lastLetter.downcase
				endsWithY = "y" == lastLetter.downcase

				#Append the corresponding suffix
				if(endsWithVowel)
					pigLatinWord = englishWord + "yay"
				elsif(endsWithY)
					pigLatinWord = englishWord + "nay"
				else
					pigLatinWord = englishWord + "ay"
				end
			else
				#Consonants at the beginning of the word
				consonants = ""
				englishWord.each_char do |letter|
					isVowel = vowels.include? letter.downcase
					if(isVowel)
						break
					end
					consonants += letter
				end

				#Move consonants to the end and append the suffix
				pigLatinWord = englishWord[consonants.length .. -1] + consonants.downcase + "ay"
			end

			#Returns capitalized word if the original word is capitalized
			return isCapitalized ? pigLatinWord.capitalize : pigLatinWord
		end
end