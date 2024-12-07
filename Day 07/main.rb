input = open('./input.txt').readlines.map(&:strip)

def ltr_eval(xpr)
  # puts "Got Expression #{xpr}"
  xpr = xpr.split(" ")
  total = xpr.shift
  xpr.each_with_index do | n, ix |
    if (ix % 2 == 0)
      xprstr = "#{total} #{n} #{xpr[ix + 1]}"
      # puts xprstr
      total = eval(xprstr)
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
    
    all_instructions.each do | instructions |
      # puts instructions.inspect
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