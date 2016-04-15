
      # header = Header.new(request_lines)

      #
      # headers = ["http/1.1 200 ok",
      #   "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
      #   "server: ruby",
      #   "content-type: text/html; charset=iso-8859-1",
      #   "content-length: #{output.length}\r\n\r\n"].join("\r\n")
      #
      body = ["HTTP/1.1 302 Found",
          "Location: http://127.0.0.1:9292/game",
          "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          "server: ruby",
          "content-type: text/html; charset=iso-8859-1",
          "content-length: #{output.length}\r\n\r\n"].join("\r\n")


      # client.puts headers unless response.verb
      # client.puts header2 if response.verb
