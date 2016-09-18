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
		sentence =  "Hello my friends"
		piglatin = Piglatin.new(sentence)
		it "should have a method named 'phrase'" do
			expect(piglatin).to respond_to(:phrase)
		end

		it "should have the method phrase but it needs to return the sentence" do
			expect(piglatin.phrase).to eq("Hello my friends")
		end
	end
end