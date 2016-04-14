  class ResponseParser
    attr_reader :request_lines

    def initialize(request_lines)
      # @output_hash = output_hash(request_lines)
      @request_lines = request_lines
    end

    def string_output
      hash1 = first_three_hashes
      hash2 = header
      output_hash = hash1.merge(hash2)

      output_string = output_hash.map do |key,value|
        + key + ": " + value
      end.join("\n")
    end

    def first_three_hashes
      first_three = request_lines[0].split(" ")
      host_port = request_lines[1].split(" ")[1].split(":")

      hash = Hash.new
      hash["Verb"] = first_three[0]
      hash["Path"] = first_three[1]
      hash["Protocol"] = first_three[2]
      hash[""]
      hash
    end

    def header
      lines = request_lines.drop(1)

      lines_split = lines.map { |line| line.split(": ") }
      lines_split.to_h
    end

    def output_hash
      hash1 = first_three_hashes
      hash2 = header
      hash1.merge(hash2)
    end

    def path
      output_hash["Path"]
    end


  end
