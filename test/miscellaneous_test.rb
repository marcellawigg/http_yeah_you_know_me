response =        "<pre>
      Verb: POST
      Path: /
      Protocol: HTTP/1.1
      Host: 127.0.0.1
      Port: 9292
      Origin: 127.0.0.1
      Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
      </pre>"


      ["GET / HTTP/1.1",
       "Host: localhost:9292",
       "Connection: keep-alive",
       "Cache-Control: no-cache",
       "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36",
       "Postman-Token: 078851e5-1c3e-d215-7828-4add7511d7df",
       "Accept: */*",
       "Accept-Encoding: gzip, deflate, sdch",
       "Accept-Language: en-US,en;q=0.8,es;q=0.6"]

       request_lines.map { |line| line.split(": ") }
       first_three = request_lines[0].split(" ")
       host_port = request_lines[1].split(" ")[1].split(":")


       {
         Verb: "#{first_three[0]}"
         Path: "#{first_three[1]}"
         Protocol: "#{first_three[2]}"
         Host:
       }
