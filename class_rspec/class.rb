class Class
	attr_reader :name, :students
	def initialize(name, students = [])
		@name = name
		@students = students
	end

	def add_student(student)
		@students << student
	end
end