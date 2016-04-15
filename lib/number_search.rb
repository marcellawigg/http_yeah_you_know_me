module NumberSearch

  def check_class
    if ps.guess.class == Fixnum && (0..100).include?(ps.guess)
      ps.guess_count += 1
      true
    else
      false
    end
  end

  def number_comparison
    if check_class
      if ps.guess > ps.random_number
        "Guess: #{ps.guess}\nYour guess was too high."
      elsif ps.guess < ps.random_number
        "Guess: #{ps.guess}\nYour guess was too low."
      else
        "Guess: #{ps.guess}\nYour guess was correct! ZAYM!!!"
      end
    else
      "Invalid input."
    end
  end

end
