# Part 1
input = open('./input.txt').readlines.map(&:strip)[0]

def parse_blocks(input)
  blocks = []

  input.split('').each_with_index do | digit, ix |
    if ix % 2 == 0
      digit.to_i.times do
        blocks << "#{ix / 2}"
      end
    else
      digit.to_i.times do
        blocks << '.'
      end
    end
  end

  return blocks
end

def parse_blocks_into_segments(input)
  blocks = []

  input.split('').each_with_index do | digit, ix |
    if ix % 2 == 0
      blocks << ("#{ix / 2}," * digit.to_i).split(',')
    else
      blocks << ('.,' * digit.to_i).split(',')
    end
  end

  return blocks
end

def part_one(input)
  # Parse filesize, index number, and spaces
  blocks = parse_blocks(input)

  fix, bix = 0, blocks.length - 1

  while(fix <= bix)
    if blocks[fix] == '.' and blocks[bix] != '.'
      blocks[fix] = blocks[bix]
      fix += 1
      blocks[bix] = '.'
      bix -= 1
    else
      fix += 1 if blocks[fix] != '.'
      bix -= 1 if blocks[bix] == '.'
    end
  end

  checksum = 0

  blocks.each_with_index do | block, ix |
    unless block == '.'
      checksum += block.to_i * ix
    end
  end
  puts "Part 1: The file checksum is now: #{checksum}"
end

def part_two(input)
  blocks = parse_blocks_into_segments(input)

  puts blocks.inspect

  fix, bix = 0, blocks.length - 1

  while fix <= bix
    if blocks[fix][0] == "." and blocks[bix][0] != "."
      if blocks[fix].length <= blocks[bix].length
        blocks[fix]
    end
  end


end

part_one(input)

part_two(input)