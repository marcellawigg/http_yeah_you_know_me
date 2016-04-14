module WordSearch

  def word
    path = response.path.split("=")
    path[-1]
  end

  def include_word
    @dictionary.include?(word)
  end

  def output_word(path)
    if include_word
      "WORD is a known word"
    else
      "WORD is not a known word"
    end
  end

end
