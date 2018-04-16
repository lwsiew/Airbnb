require 'rspec'
require_relative 'student'

describe Student do
	let(:student){Student.new("Nicholas", "1997-11-30")}
	context "initialize" do
		it "has name" do
			expect{student.name}.to_not raise_error
		end

		it "has birthday" do
			expect{student.birthday}.to_not raise_error
		end
	end

	context "age" do
		it "calculates age" do
			expect(student.age).to eq("20")
		end
	end
end