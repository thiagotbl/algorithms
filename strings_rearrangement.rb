def solution(inputArray)
    used = Array.new(inputArray.size, false)

    aux(inputArray, used, nil, 0)
end

def aux(inputArray, used, prev, count)
    return true if count == inputArray.size

    for i in 0...inputArray.size
        next if used[i]

        if prev.nil? || differ_by_one_char?(prev, inputArray[i])
            used[i] = true

            if aux(inputArray, used, inputArray[i], count + 1)
                return true
            end

            used[i] = false
        end
    end

    false
end

def differ_by_one_char?(a, b)
    count = 0

    i = 0
    while i < a.size
        if a[i] != b[i]
            count += 1
        end

        i += 1
    end

    count == 1
end

puts "[aba, bbb, bab]: #{solution(["aba", "bbb", "bab"])}"
puts "[ab, bb, aa]: #{solution(["ab", "bb", "aa"])}"
