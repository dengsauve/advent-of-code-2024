input = open('./input.txt').readlines.map(&:strip)

def ltr_eval(xpr)
  # puts "Got Expression #{xpr}"
  xpr = xpr.split(" ")
  total = xpr.shift
  xpr.each_with_index do | n, ix |
    if (ix % 2 == 0)
      if n == "||"
        total = (total.to_s + xpr[ix + 1].to_s).to_i
      else
        xprstr = "#{total} #{n} #{xpr[ix + 1]}"
        # puts "Expression: #{xprstr}"
        total = eval(xprstr)
      end
    end
  end
  return total
end

total_calibration_result = 0
input.each do | calibration |
  puts "Working on: #{calibration}"
  result = calibration.split(":")[0].to_i
  numbers = calibration.split(":")[1].strip.split(" ").map(&:to_i)
  if numbers.sum == result
    total_calibration_result += numbers.sum
  elsif numbers.inject(:*) == result
    total_calibration_result += numbers.inject(:*)
  else
    op_count = numbers.count - 1

    adders = Array.new(op_count) { "+" }
    multipliers = Array.new(op_count) { "*" }

    # all_instructions = (adders + multipliers).permutation(op_count).uniq # No good, too many permutations
    # puts all_instructions.inspect
    all_instructions = []
    (3 ** op_count).times do | num |
      # Convert num to binary with op_count length, to_s
      bin = num.to_s(3)
      bin = "%0#{op_count}d" % bin
      
      # puts "tern: #{bin.inspect}"
      # Then, swap 0 for + and 1 for *
      bin.gsub! '0', '+ '
      bin.gsub! '1', '* '
      bin.gsub! '2', '|| '
      # Add to all_instructions
      # puts "converted tern: #{bin.inspect}"
      all_instructions << bin.split(' ')
    end
    
    all_instructions.each do | instructions |
      # puts "instructions: #{instructions.inspect}"
      equation = numbers.zip(instructions).flatten.compact.join(" ")
      # puts equation
      eval_result = ltr_eval(equation)
      # puts " = #{eval_result} - Expected: #{result}"
      if eval_result == result
        # puts "MATCH FOUND, ADDING #{result} TO TOTAL"
        total_calibration_result += result
        break
      end
    end
  end
end

puts total_calibration_result

# too low, 12839601725877 correct