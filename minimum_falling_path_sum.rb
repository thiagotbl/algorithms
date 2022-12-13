# @param {Integer[][]} matrix
# @return {Integer}
def min_falling_path_sum(matrix)
    memo = {}

    (0...matrix[0].size).map do |j|
        fall(matrix, 0, j, memo)
    end.min
end

def fall(matrix, i, j, memo)
    return Float::INFINITY if j < 0 || j >= matrix[i].size

    return matrix[i][j] if i == matrix.size - 1

    return memo["#{i},#{j}"] if memo.has_key?("#{i},#{j}")

    below = fall(matrix, i + 1, j, memo)
    diagonally_left = fall(matrix, i + 1, j - 1, memo)
    diagonally_right = fall(matrix, i + 1, j + 1, memo)

    memo["#{i},#{j}"] = matrix[i][j] + [below, diagonally_left, diagonally_right].min
end

# p min_falling_path_sum([[-19,57],[-40,-5]])

# -36 expected
p min_falling_path_sum(
  [
    [100 ,-42, -46,-41],
    [31  ,97 , 10 ,-10],
    [-58 ,-51, 82 ,89],
    [51  ,81 , 69 ,-51]]
)
