def group_anagrams(words)
  anagrams = {}

  words.each do |word|
    key = char_map(word)

    if anagrams[key] == nil
      anagrams[key] = []
    end

    anagrams[key].push(word)
  end

  anagrams.values
end

def char_map(word)
  map = {}

  word.each_char do |c|
    if map[c] == nil
      map[c] = 0
    end

    map[c] += 1
  end

  map
end

pp group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
pp group_anagrams(["word", "sword", "drow", "rowd", "iced", "dice"])
pp group_anagrams(["eat", "drink", "sleep", "repeat"])

# n being the size of words array
# k being the max size of a single word

# Time complexity: O(n * K)
# Space complexity: O(n * K)
