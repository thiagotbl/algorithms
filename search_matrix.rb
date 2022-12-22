# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    row = find_row(matrix, target)
    column = find_column(matrix, row, target)

    "#{row},#{column}"
end

def find_row(matrix, target)
    top = 0
    bottom = matrix.size - 1

    while top <= bottom
        mid = (top + bottom) / 2
        value = matrix[mid][0]

        return mid if value == target

        if value > target
            bottom = mid - 1
        else
            top = mid + 1
        end
    end

    [top - 1, 0].max
end

def find_column(matrix, row, target)
    left = 0
    right = matrix[row].size - 1

    while left <= right
        mid = (left + right) / 2

        value = matrix[row][mid]

        return mid if value == target

        if value > target
            right = mid - 1
        else
            left = mid + 1
        end
    end

    -1
end

p search_matrix(
    [[1,3,5]],
    1
)
