# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
    keys = rooms.first

    visited = Array.new(rooms.size, false)
    visited[0] = true

    while !keys.empty?
        key = keys.pop

        next if visited[key]

        keys += rooms[key]
        visited[key] = true
    end

    visited.all?
end

p can_visit_all_rooms([[1],[2],[3],[]])
