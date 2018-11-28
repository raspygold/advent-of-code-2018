module Solvable
  # identify the correct day's input path and make it accessible to the caller but still a concern of this module
  def self.included(base)
    base.extend ClassMethods

    caller_path = caller[0].partition(":")[0]
    input_path  = caller_path.split("/")[1]
    define_method :input_path do |filename|
      File.expand_path(filename, input_path)
    end 
  end

  module ClassMethods
    def define_solution(part)
      define_method part do |input|
        yield(input)
      end
    end
  end

  def read_input(filename)
    input = File.readlines(input_path(filename)).map(&:strip)
    input = input.first if input.size == 1 # unwrap the array if it's just one line
  end

  def test(part, input, expected_result)
    result = send(part, input)
    
    if result == expected_result
      input_sample = input.size > 10 ? input.take(10) + "..." : input
      puts "#{part.capitalize} test passed with input: #{input_sample}", ""
    else
      puts %Q(#{part.capitalize} test failed!\n
Expected: #{expected_result.inspect}\n\
  Actual: #{result.inspect}\n\n)
      exit
    end
  end

  def solve(part, input_filename)
    input = read_input(input_filename)
    solution = send(part, input) || "none"

    puts "Solution to #{part.capitalize}:", solution, ""
  end
end
