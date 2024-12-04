input = open('./input.txt').readlines
input.map!(&:strip)

# Read in and seach vertincally (backwards and forwards)
count = 0
# input.each_with_index do | line, index |
#     count += line.scan(/XMAS/).size
#     count += line.reverse.scan(/XMAS/).size
#     input[index] = line.split("")
# end

# # Rotate array by 90
# rot_arr = []
# input.transpose.each do | line |
#     rot_arr << line.reverse
# end

# rot_arr.each do | line |
#     line = line.join()
#     puts line
#     count += line.scan(/XMAS/).size
#     count += line.reverse.scan(/XMAS/).size
# end

# # Rotate array by -45
# ang_arr = []
# max_x = input[0].length - 1
# max_y = input.length - 1
# max_loop = max_x + max_y + 1
# bound = [max_x, max_y].min

# xx = 0
# yy = 0

# max_loop.times do | t |
#     ang = []
#     x = 0
#     x = t - yy if t > yy
#     y = yy
#     t = max_loop - t - 1 if t > bound
#     (t + 1).times do
#         puts t, [x, y].inspect
#         ang << rot_arr[y][x]
#         y -= 1
#         x += 1
#     end
#     ang_arr << ang.join('')
#     puts ang_arr.inspect
#     if(yy > max_x)
#         xx += 1
#     end
#     if (yy < max_y)
#         yy += 1
#     end
# end

# puts ang_arr

# ang_arr.each do | line |
#     count += line.scan(/XMAS/).size
#     count += line.reverse.scan(/XMAS/).size
# end

# # Rotate array by 45
# ang_arr = []
# max_x = input[0].length - 1
# max_y = input.length - 1
# max_loop = max_x + max_y + 1
# bound = [max_x, max_y].min

# xx = 0
# yy = 0

# max_loop.times do | t |
#     ang = []
#     x = 0
#     x = t - yy if t > yy
#     y = yy
#     t = max_loop - t - 1 if t > bound
#     (t + 1).times do
#         puts t, [x, y].inspect
#         ang << input[y][x]
#         y -= 1
#         x += 1
#     end
#     ang_arr << ang.join('')
#     puts ang_arr.inspect
#     if(yy > max_x)
#         xx += 1
#     end
#     if (yy < max_y)
#         yy += 1
#     end
# end

# puts ang_arr

# ang_arr.each do | line |
#     count += line.scan(/XMAS/).size
#     count += line.reverse.scan(/XMAS/).size
# end

max_x = input[0].length
max_y = input.length
counter = 0
(max_y - 2).times do | y |
    (max_x - 2).times do | x |
        scanner = ""
        scanner += input[y][x..(x+2)]
        scanner += input[y + 1][x..(x+2)]
        scanner += input[y + 2][x..(x+2)]
        puts scanner
        # M.M S.M S.S M.S
        # .A. .A. .A. .A.
        # S.S S.M M.M M.S
        count += scanner.scan(/M.M.A.S.S/).size
        count += scanner.scan(/S.M.A.S.M/).size
        count += scanner.scan(/S.S.A.M.M/).size
        count += scanner.scan(/M.S.A.M.S/).size
        counter += 1
    end
end


puts counter, count