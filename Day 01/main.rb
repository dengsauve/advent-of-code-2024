#! /usr/bin/ruby
input = open('./input.txt').readlines

list_1 = []
list_2 = []

input.each_with_index do | line, index |
    line = line.strip.split("\ \ \ ")
    list_1 << line[0].to_i
    list_2 << line[1].to_i
end

distance = 0

list_1.sort!
list_2.sort!

list_1.each_with_index do | one, index |
    two = list_2[index]
    distance += (one - two).abs
end

puts list_1.inspect, list_2.inspect, distance

puts "Part II: "

l2_tally = list_2.group_by(&:itself).transform_values(&:count)
puts l2_tally.inspect
similarity = 0

list_1.each_with_index do | num, index |
    if l2_tally.key?(num)
        occ = l2_tally[num]
        similarity += num * occ
    end
end

puts similarity