# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
    result = []

    aux(s, "", result)

    result
end

def aux(s, current, result)
    if current.size == s.size
        result.push(current.dup)

        return
    end

    char = s[current.size]

    if number?(char)
        aux(s, current + char, result)
    else
        lowercase = char.downcase
        uppercase = char.upcase

        aux(s, current + lowercase, result)
        aux(s, current + uppercase, result)
    end
end

def number?(char)
    char.to_i.to_s == char
end

p letter_case_permutation("a1b2")
