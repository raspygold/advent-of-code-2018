#!/usr/bin/env ruby
# To produce the solutions, simply enter the directory and run:
#    ruby solution.rb

class Solution
  require_relative "../solvable"
  include Solvable

  define_solution :part1 do |input|
  end

  define_solution :part2 do |input|
  end
end

solution = Solution.new

# testing the solution using the provided test cases
solution.run_tests(
  part1: [["test input", nil]],
  part2: [["test input", nil]]
)

# produce the solution using the challenge input
solution.solve
