#Testing the class: Piglatin
require '../piglatinClass'

RSpec.describe "Piglatin" do

	describe "instance" do
		it "should create a Piglatin object" do
			piglatin = Piglatin.new("")
			expect(piglatin).to be_an_instance_of(Piglatin)
		end
	end

	describe "sentence" do
		sentence =  "Hello my friends"
		piglatin = Piglatin.new(sentence)
		it "should be reset without reinitializing" do
			piglatin.sentence = "Hello folks"
			expect(piglatin.phrase).to eq("Hello folks")
		end

		it "should be private" do 
			expect {piglatin.sentence}.to raise_error(NoMethodError)
		end
	end

	describe "object" do
		describe "method 'phrase'" do
			sentence =  "Hello my friends"
			piglatin = Piglatin.new(sentence)

			it "should exists" do
				expect(piglatin).to respond_to(:phrase)
			end

			it "should return the sentence" do
				expect(piglatin.phrase).to eq("Hello my friends")
			end
		end

		describe "method 'translateWord'" do
			sentence =  "Hello my friends"
			piglatin = Piglatin.new(sentence)

			it "should exists" do
				expect {piglatin.send(:translateWord)}.not_to raise_error(NoMethodError)
			end

			it "should receive an english word and return it in pig latin" do
				expect(piglatin.send(:translateWord,"Hello")).to eq("Ellohay")
				expect(piglatin.send(:translateWord,"Well")). to eq("Ellway")
				expect(piglatin.send(:translateWord,"think")).to eq("inkthay")
				expect(piglatin.send(:translateWord,"welcome")).to eq("elcomeway")
				expect(piglatin.send(:translateWord,"known")).to eq("ownknay")
				expect(piglatin.send(:translateWord,"enough")).to eq("enoughay")
				expect(piglatin.send(:translateWord,"any")).to eq("anynay")
				expect(piglatin.send(:translateWord,"special")).to eq("ecialspay")
			end
		end

		describe "method 'createDictionary'" do
			sentence =  "Hello my friends this is my new: car!"
			piglatin = Piglatin.new(sentence)

			it "should exists" do
				expect {piglatin.send(:createDictionary)}.not_to raise_error(NoMethodError) 
			end

			it "should return a hash with the english words contained in the sentence and their translations" do
				
				expect(piglatin.send(:createDictionary)).to include(
					"Hello" => "Ellohay",
					"my" => "myay",
					"friends" => "iendsfray",
					"this" => "isthay",
					"is" => "isay",
					"new" => "ewnay",
					"car" => "arcay"
				)

				piglatin.sentence = "What do you think when you hear 'well-being'?"

				expect(piglatin.send(:createDictionary)).to include(
					"What" => "Atwhay",
					"do" => "oday",
					"you" => "ouyay",
					"think" => "inkthay",
					"when" => "enwhay",
					"hear" => "earhay",
					"well" => "ellway",
					"being" => "eingbay"
				)

				piglatin.sentence = "I love analyze any problems"

				expect(piglatin.send(:createDictionary)).to include(
					"I" => "Iyay",
					"love" => "ovelay",
					"analyze" => "analyzeyay",
					"any" => "anynay",
					"problems" => "oblemspray"
				)

			end
		end
	end
end