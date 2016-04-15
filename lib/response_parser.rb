  class ResponseParser
    attr_reader :request_lines

    def initialize(request_lines)
      @request_lines = request_lines
    end

    def string_output
      hash1 = first_three_hashes
      hash2 = headers
      output_hash = hash1.merge(hash2)

      output_string = output_hash.map do |key,value|
        + key + ": " + value
      end.join("\n")
    end

    def first_three_hashes
      first_three = request_lines[0].split(" ")

      hash = Hash.new
      hash["Verb"] = first_three[0]
      hash["Path"] = first_three[1]
      hash["Protocol"] = first_three[2]
      hash[""]
      hash
    end

    def headers
      lines = request_lines.drop(1)

      lines_split = lines.map { |line| line.split(": ") }
      lines_split.to_h
    end

    def header_string
      headers.map do |key,value|
        key + ": " + value
      end.join("\n")
    end

    def output_hash
      hash1 = first_three_hashes
      hash2 = headers
      hash1.merge(hash2)
    end

    def path
      output_hash["Path"]
    end

    def verb
      output_hash["Verb"]
    end

    def protocol
      output_hash["Protocol"]
    end

    def host
      output_hash["Host"].split(":")[0]
    end

    def port
      output_hash["Host"].split(":")[1]
    end

    def content_length
      output_hash["Content-Length"].to_i
    end

  end
