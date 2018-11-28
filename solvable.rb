module Solvable
  # identify the correct day's input path and make it accessible to the caller but still a concern of this module
  def self.included(obj)
    caller_path = caller[0].partition(":")[0]
    input_path = File.expand_path("input", caller_path.split("/")[1]) 
    define_method :input_path do
      input_path 
    end 
  end

  # handle input files
  def read_input
    File.read(input_path).chomp
  end

  def read_input_lines
    File.readlines(input_path).map(&:strip)
  end

  # define blocks for parts 1 & 2 to encapsulate specific logic and results
  %i(1 2).each do |part|
    define_method "part#{part}" do |&b|
      puts  "Solution to Part #{part}:", b.call, ""
    end
  end
end
