# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
    top_left = [0,0]
    bottom_right = [matrix.size - 1, matrix[0].size - 1]

    while top_left != bottom_right
        origin_top_left = [top_left[0], top_left[1]]
        origin_bottom_right = [bottom_right[0], bottom_right[1]]

        puts "origin left: #{origin_top_left}"
        puts "origin right: #{origin_bottom_right}"

        top_right = [top_left[0], bottom_right[1]]
        bottom_left = [bottom_right[0], top_left[1]]

        while top_left[1] < origin_bottom_right[1]
            top_left_value = matrix[top_left[0]][top_left[1]]

            matrix[top_left[0]][top_left[1]] = matrix[bottom_left[0]][bottom_left[1]]
            matrix[bottom_left[0]][bottom_left[1]] = matrix[bottom_right[0]][bottom_right[1]]
            matrix[bottom_right[0]][bottom_right[1]] = matrix[top_right[0]][top_right[1]]
            matrix[top_right[0]][top_right[1]] = top_left_value

            top_left[1] += 1
            top_right[0] += 1
            bottom_right[1] -= 1
            bottom_left[0] -= 1
        end

        top_left = [origin_top_left[0] + 1, origin_top_left[1] + 1]
        bottom_right = [origin_bottom_right[0] - 1, origin_bottom_right[1] - 1]

        puts "top left: #{top_left}"
        puts "bottom right: #{bottom_right}"
    end
end

matrix = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

rotate(matrix)

p matrix
