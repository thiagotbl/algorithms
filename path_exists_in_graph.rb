require 'set'

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} source
# @param {Integer} destination
# @return {Boolean}
def valid_path(n, edges, source, destination)
    nodes = {}

    for i in 0...n
        nodes[i] = Set.new
    end

    edges.each do |edge|
        node_a = edge[0]
        node_b = edge[1]

        nodes[node_a].add(node_b)
        nodes[node_b].add(node_a)
    end

    visited = [source].to_set
    stack = [source]

    while !stack.empty?
        node = stack.pop

        return true if node == destination

        nodes[node].each do |n|
            next if visited.include?(n)

            visited.add(n)
            stack.push(n)
        end
    end

    false
end

p valid_path(3, [[0,1],[1,2],[2,0]], 0, 2)
