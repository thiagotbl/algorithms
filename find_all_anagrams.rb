# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
    return [] if p.size > s.size

    p_chars = chars_map(p)

    window_chars = chars_map(s[0...p.size])

    left = 0
    right = p.size - 1

    indexes = []

    while right < s.size
        if window_chars == p_chars
            indexes.push(left)
        end

        left_char = s[left]
        decrement_char_count(window_chars, left_char)

        left += 1
        right += 1

        right_char = s[right]
        increment_char_count(window_chars, right_char)
    end

    indexes
end

def chars_map(text)
    char_map = {}

    text.each_char do |c|
        increment_char_count(char_map, c)
    end

    char_map
end

def increment_char_count(chars_map, char)
    if !chars_map.key?(char)
        chars_map[char] = 0
    end

    chars_map[char] += 1
end

def decrement_char_count(chars_map, char)
    chars_map[char] -= 1

    if chars_map[char] == 0
        chars_map.delete(char)
    end
end

p find_anagrams("cbaebabacd", "abc")
