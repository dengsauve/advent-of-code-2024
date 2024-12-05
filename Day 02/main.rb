input = open('./input.txt').readlines

input.map!(&:strip)

puts input.inspect

total_safe = 0
input.each do | report |
  safe_reports = 0
  report = report.split(" ").map(&:to_i)
  (report.length).times do | zap |
    sreport = report.dup.tap{|i| i.delete_at(zap)}
    safe = true
    increase = false
    decrease = false
    (sreport.length - 1).times do | index |
    decrease = true if sreport[index] > sreport[index + 1]
    increase = true if sreport[index] < sreport[index + 1]
      if (sreport[index] - sreport[index + 1]).abs > 3 or sreport[index] == sreport[index + 1]
        safe = false
      end
    end
    safe_reports += 1 if safe and increase != decrease
  end
  total_safe += 1 if safe_reports > 0
end

puts total_safe
# 244 too high
# 271 too low for part 2 