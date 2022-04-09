def caesar_cypher(text, factor)
  string = text.downcase
  letters = string.split("")
  alphabet = ('a'..'z').to_a
  for i in 0..letters.length-1
    for j in 0..alphabet.length-1
      if letters[i] == alphabet[j]
        letters[i] = j+1
      end
    end
  end

  if factor > alphabet.length
    factor = factor % alphabet.length
  end

  letters = letters.map { |char| 
    if char.is_a? Numeric
      char = char+factor
    else
      char = char
    end
  } 

  for i in 0..letters.length-1
    if (letters[i].is_a? Numeric) && (letters[i] > alphabet.length)
      letters[i] -= alphabet.length
    end
    for j in 0..alphabet.length-1
      if letters[i] == j
        letters[i] = alphabet[j-1]
      end
    end
  end

  text.split("")
  for i in 0..letters.length-1
    if text[i] == text[i].upcase
      letters[i].upcase!
    end
  end

  puts letters.join.to_s

end
