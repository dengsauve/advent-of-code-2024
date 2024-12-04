input = open('./input.txt').readlines

results = []
input.each do | line |
  results << line.scan(/mul\(\d{1,3},\d{1,3}\)/)
end

results.flatten!
sum = 0
results.each do | r |
  par = r.split("mul(")[1].split(")")[0].split(",").map(&:to_i)
  sum += par[0].to_i * par[1].to_i
end

puts sum

# Part Two

results = []
input.each do | line |
  partial_res = []
  line.scan(/mul\(\d{1,3},\d{1,3}\)/) do |c|
    partial_res << [c, $~.offset(0)[0]]
  end
  line.scan(/do\(\)/) do |c|
    partial_res << [c, $~.offset(0)[0]]
  end
  line.scan(/don't\(\)/) do |c|
    partial_res << [c, $~.offset(0)[0]]
  end
  partial_res.sort! { |a, b| a[1] <=> b[1]}
  partial_res.each do | pr |
    results << pr
  end
end

puts results.inspect

enabled = true
sum = 0
results.each do | res |
  if enabled
    if res[0][0..2] == "mul"
      nums = res[0].split("mul(")[1].split(")")[0].split(",").map(&:to_i)
      sum += nums.inject(:*)
    elsif res[0][0..2] == "don"
      enabled = false
    end
  else
    if res[0][0..2] == "do("
      enabled = true
    end
  end
end

puts sum

# Too High 94180746