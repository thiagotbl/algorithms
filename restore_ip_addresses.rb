# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
    result = []

    aux(s, 0, "", result)

    result
end

def aux(s, i, current, result)
    if i >= s.size
        if valid_ip?(current)
            result.push(current.dup)
        end

        return
    end

    aux(s, i + 1, current + s[i] + ".", result)
    aux(s, i + 1, current + s[i], result)
end

def valid_ip?(ip)
    return false if ip[ip.size - 1] == "."

    sections = ip.split(".")

    return false if sections.size != 4

    sections.all? { |section| valid_section?(section) }
end

def valid_section?(section)
    !leading_zero?(section) &&
        section.to_i >= 0 &&
        section.to_i <= 255
end

def leading_zero?(section)
    section.size != section.to_i.to_s.size
end

p restore_ip_addresses("101023")
