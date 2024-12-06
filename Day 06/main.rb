input = open('./input.txt').readlines.map(&:strip)
input.each_with_index do | arr, ix |
    input[ix] = arr.split("")
end

px, py = 0, 0
bx, by = input[0].length, input.length

input.each_with_index do | row, y |
    row.each_with_index do | c, x |
        if c == "^"
            px = x
            py = y
        end
    end
end

puts px, py

# Set up directions
dx = 0
dy = -1
# positions = [[px, py]]
# while px >= 0 and px < bx - 1 and py >= 0 and py < by - 1
#     # puts "#{px} #{py} #{dx} #{dy} "
#     # Check for valid
#     if input[py + dy][px + dx] == "#"
#         # rotate by 90
#         if dy != 0
#             dx, dy = dy * -1, 0
#         elsif dx != 0
#             dx, dy = 0, dx
#         end
#     else
#         # Increment positions
#         px, py = px + dx, py + dy
#         # Log location
#         positions << [px, py]
#     end
# end

def check_if_loop(input, px, py, bx, by)
    dx = 0
    dy = -1
    positions = [[px, py]]
    counter = 0
    ret = false
    while px >= 0 and px < bx - 1 and py >= 0 and py < by - 1
        # puts "#{px} #{py} #{dx} #{dy} "
        # Check for valid
        if input[py + dy][px + dx] == "#"
            # rotate by 90
            if dy != 0
                dx, dy = dy * -1, 0
            elsif dx != 0
                dx, dy = 0, dx
            end
        else
            # Increment positions
            px, py = px + dx, py + dy
            # Log location
            positions << [px, py]
        end
        counter += 1
        if counter > 100000
            puts "counter over 100000"
            ret = true
            break
        end
    end
    return ret
end
    
# puts  positions.uniq.size

input.each_with_index do | row, y |
    row.each_with_index do | c, x |
        if c == "^"
            px = x
            py = y
        end
    end
end

dx = 0
dy = -1

puts check_if_loop(input, px, py, bx, by)

insertion_count = 0

(py...by).each do | ins_y |
    (bx + 1).times do | ins_x |
        if input[ins_y][ins_x] == "."
            testmap = input.map(&:clone)
            testmap[ins_y][ins_x] = "#"
            if check_if_loop(testmap, px, py, bx, by)
                insertion_count += 1
            end
        end
    end
end

puts "insertion_count: #{insertion_count}"

puts "done" #6031, 5991 too high, but 483 is too low? 5232 not correct, 