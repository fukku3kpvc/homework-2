def frequency(words_arr)
  words_arr.inject(Hash.new(0)) { |result, word|
  result.update({ word => 1 }) { |key, old_value, new_value| old_value + new_value } }
end

words = []
File.open(Dir.pwd + '/stations.txt') do |f_in|
  f_in.each do |line|
    line.delete!("\n")
    line.gsub!(/[^\p{L}\s\d]/, '')
    line = line.downcase
    words += line.split(' ')
  end
end
puts frequency(words)