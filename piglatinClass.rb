class Piglatin

	attr_writer :sentence	

	def initialize(sentence)
		@sentence = sentence
	end

	def phrase()
		return @sentence
	end	
end