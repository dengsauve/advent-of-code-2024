input = open('./input.txt').readlines.map(&:strip)

def draw_map(locations, mx, my)
  map = []
  my.times do
    map << Array.new(mx) {'.'}
  end
  locations.each do | loc |
    map[loc[1]][loc[0]] = "#"
  end
  map.each do | line |
    puts line.join
  end
end

# Setup dict and maxes
my = input.length
mx = input[0].length
location_dict = {}
[("a".."z"), ("A".."Z"), ("0".."9")].each do | signals |
  signals.each do | signal |
    location_dict[signal] = []
  end
end

# Read in locations and populate dict
input.each_with_index do | line, y |
  line.split('').each_with_index do | loc, x |
    unless loc == '.'
      location_dict[loc] << [x, y]
    end
  end
end

puts location_dict

antinodes = []

location_dict.each_key do | key |
  antennae = location_dict[key]
  if antennae.count > 0
    antennae.each do | main |
      antennae.each do | other |
        unless main == other
          dx, dy = (other[0] - main[0]), (other[1] - main[1])

          an1x, an1y = main[0] - dx, main[1] - dy
          an2x, an2y = other[0] + dx, other[1] + dy

          antinodes << [an1x, an1y] if an1x < mx and an1x >= 0 and an1y < my and an1y >= 0
          antinodes << [an2x, an2y] if an2x < mx and an2x >= 0 and an2y < my and an2y >= 0
        end
      end
    end
  end
end

puts antinodes.uniq.count

draw_map(antinodes.uniq, mx, my)