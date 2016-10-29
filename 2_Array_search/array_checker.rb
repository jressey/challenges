#open in this directory terminal/cmd and run `ruby array_checker.rb`
#all test cases should evaluate to true

class ArrayChecker
	attr_accessor :arrays, :target
	
	def initialize(arrays, target)
		@arrays = arrays
		@target = target
		@result = []
	end
	
	def check_arrays
		validate_input
		return @error if !@error.nil?
		@arrays.each do |a|
			validate_sub_array(a)
			return @error if !@error.nil?
			@result << a if a.include?(target)
		end
		return @result
	end

	def validate_input
		if arrays.nil?
			@error = 'please input a non-nil value for arrays' 
			return
		end
		if target.nil?
			@error = 'please input a non-nil value for target'
			return
		end
		if arrays.size != 4 
			@error = 'please input exactly 4 arrays'
			return
		end
	end

	def validate_sub_array(a)
		if !a.is_a? Array
			@error = 'please input array elements within the array argument'
			return
		end
		if a.size != 4 
			@error = 'please input sub arrays with exactly 4 elements'
			return
		end
		a.each do |e| 
			if !e.is_a? Fixnum 
				@error =  'please input integer values in all sub arrays' 
				return
			end
		end
	end
end

puts 'Test cases'
puts '----------'
arrays = nil
target = 1 
puts "Test case 'Nil arrays arg'" 
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == 'please input a non-nil value for arrays'}"

arrays = arrays = [[1,2,3,4], [2,3,4,5], [3,4,5,6], [4,5,6,7]]
target = nil
puts "Test case 'Nil target arg'"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == 'please input a non-nil value for target'}"

arrays = arrays = [[1,2,3,4], [2,3,4,5], [3,4,5,6]]
target = 1
puts "Test case 'Fewer than 4 sub arrays'"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == 'please input exactly 4 arrays'}"

arrays = arrays = [[1,2,3,4], [2,3,4,5], [3,4,5,6], [4,5,6]]
target = 1
puts "Test case 'Fewer than 4 elements in 1 sub array'"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == 'please input sub arrays with exactly 4 elements'}"

arrays = arrays = [[1,2,3,4], [2,3,4,5], [3,4,5,6], [4,5,6, "foo"]]
target = 1
puts "Test case 'String arg in sub array'"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == 'please input integer values in all sub arrays'}"

arrays = [[1,2,3,4], [2,3,4,5], [3,4,5,6], "not an array"]
target = 1
puts "Test case 'String arg in array'"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == 'please input array elements within the array argument'}"

arrays = [[1,2,3,4], [2,3,4,5], [3,4,5,6], [4,5,6,7]]
target = 2
puts "Test case 'return arrays which have target value"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == [[1,2,3,4], [2,3,4,5]]}"

arrays = [[1,2,3,4567], [2,3,4567,5], [3,4567,5,6], [4,5,6,7]]
target = 4567
puts "Test case 'return arrays which have target value with large value"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == [[1,2,3,4567], [2,3,4567,5], [3,4567,5,6]]}"

arrays = [[1,2,3,-4567], [2,3,-4567,5], [3,-4567,5,6], [4,5,6,7]]
target = -4567
puts "Test case 'return arrays which have target value which is a negative integer"
puts "passed: #{ArrayChecker.new(arrays, target).check_arrays == [[1,2,3,-4567], [2,3,-4567,5], [3,-4567,5,6]]}"

