module Solvable
  # identify the correct day's input path and make it accessible to the caller but still a concern of this module
  def self.included(base)
    base.extend ClassMethods

    #TODO: What if the inputs are different for parts 1 & 2
    caller_path = caller[0].partition(":")[0]
    input_path = File.expand_path("input", caller_path.split("/")[1]) 
    define_method :input_path do
      input_path 
    end 
  end

  module ClassMethods
    def define_solution(part)
      define_method part do |input|
        yield(input) if block_given?
      end
    end
  end

  def read_input
    input = File.readlines(input_path).map(&:strip)
    input = input.first if input.size == 1 # unwrap the array if it's just one line
  end

  def run_tests(tests_by_part={})
    tests_by_part.each do |part, tests|
      tests.each.with_index do |(input, expected_output), i|
        output = send(part, input)
        if output != expected_output
          puts %Q(#{part.capitalize} test #{i+1} failed!\n
Expected: #{expected_output.inspect}\n\
  Actual: #{output.inspect}\n\n)
          exit
        else
          input_sample = input.size > 10 ? input.take(10) + "..." : input
          puts "#{part.capitalize} test #{i+1} passed with input: #{input_sample}"
        end
      end
    end
    puts
  end

  def solve 
    input = read_input

    # generate solutions
    %i(part1 part2).each do |part|
      if respond_to?(part)
        solution = send(part, input) || "none"
        puts "Solution to #{part.capitalize}:", solution, ""
      end
    end
  end
end
