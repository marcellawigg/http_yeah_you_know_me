module Response

  attr_reader :response
  #
  # def initialize(request_lines)
  #   # @response = output(request_lines)
  # end

  def output(request_lines)
    output = ""
    hash1 = first_three_hashes(request_lines)
    hash2 = make_hash(request_lines) #refactor into methods so not defined here
    output_hash = merge(hash1,hash2)
    output_string = output_hash.map do |key,value|
      + key + ": " + value
    end.join("\n")

  end

  def request_to_nested_array(request_lines)
    request_lines.map { |line| line.split(": ") }
  end

  def first_three_hashes(request_lines)
    first_three = request_lines[0].split(" ")
    host_port = request_lines[1].split(" ")[1].split(":")


    hash = Hash.new
    hash["Verb"] = first_three[0]
    hash["Path"] = first_three[1]
    hash["Protocol"] = first_three[2]
    hash[""]
    hash
  end

  def delete_first_item(request_lines)
    request_lines.delete_at(0)
    request_lines
  end

  def make_hash(request_lines)
    # require "pry"; binding.pry
    delete_first_item(request_lines)

    request_lines = request_lines.map { |line| line.split(": ") }
    request_lines.to_h
  end


  def merge(hash1,hash2)
    hash1.merge(hash2)
  end


end
