module NumberSearch

  def check_class
    if ps.guess.class == Fixnum && (0..100).include?(ps.guess)
      ps.guess_count += 1
      true
    else
      false
    end
  end

  def number_comparison(client)
    client.puts ok_code
    if check_class
      if ps.guess > ps.random_number
        client.puts "Guess: #{ps.guess}\nYour guess was too high. You've taken #{ps.guess_count} guesses."
      elsif ps.guess < ps.random_number
        client.puts "Guess: #{ps.guess}\nYour guess was too low. You've taken #{ps.guess_count} guesses."
      else
        client.puts "Guess: #{ps.guess}\nYour guess was correct! ZAYM!!! You got it right in #{ps.guess_count} guesses"
      end
    else
      client.puts "Invalid input."
    end
  end

  def new_game?(client)
    if @game
      client.puts forbidden_code(client)
    else
      client.puts run_code(client)
    end
  end


  def game_post(client)
    server = "HTTP/1.1 302 Move Temporarily\r\n"
    location = "Location: http://127.0.0.1:9292/game\r\n"
    client.puts server + location
  end


  # def post_header(client)
  #   client.puts ps.header_string
  # end
end
