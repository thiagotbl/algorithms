# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
    longest_path = 0
    memo = {}

    for i in 0...matrix.size
        for j in 0...matrix[i].size
            longest_path = [
                longest_path,
                find_path(matrix, i, j, memo)
            ].max
        end
    end

    longest_path
end

def find_path(matrix, i, j, memo)
    key = "#{i},#{j}"
    return memo[key] if memo.has_key?(key)

    top = next_cell_longest_path(matrix, i, j, i + 1, j, memo)
    bottom = next_cell_longest_path(matrix, i, j, i - 1, j, memo)
    right = next_cell_longest_path(matrix, i, j, i, j + 1, memo)
    left = next_cell_longest_path(matrix, i, j, i, j - 1, memo)

    memo[key] = 1 + [top, bottom, right, left].max
end

def next_cell_longest_path(matrix, curr_i, curr_j, next_i, next_j, memo)
    return 0 if out_of_bounds?(matrix, next_i, next_j) ||
        matrix[curr_i][curr_j] >= matrix[next_i][next_j]

    find_path(matrix, next_i, next_j, memo)
end

def out_of_bounds?(matrix, i, j)
    i < 0 || i >= matrix.size || j < 0 || j >= matrix[i].size
end

p longest_increasing_path([[9,9,4],[6,6,8],[2,1,1]])
p longest_increasing_path([[3,4,5],[3,2,6],[2,2,1]])
p longest_increasing_path([[1]])
