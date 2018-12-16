require 'fileutils'
require 'date'

print('Print file directory: ')
dir = gets.chomp
sum_len = 0
if File.exist? File.expand_path(dir)
  d = DateTime.now
  format = d.year.to_s + d.month.to_s + d.day.to_s + d.hour.to_s + d.minute.to_s + d.second.to_s
  file_out = File.new(Dir.pwd + '/' + format + File.basename(dir), 'w')
  File.open(File.expand_path(dir)) do |f_in|
    f_in.each do |line|
      line.delete!("\n")
      sum_len += line.length
      file_out.puts("Длина строки #{line.length} символов")
      file_out.puts(line)
    end
    file_out.puts('Общее количество символов - ' + sum_len.to_s)
  end
  file_out.close
  puts 'Done!'
else
  puts 'No such file or dir'
end