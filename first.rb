require 'fileutils'
require 'date'

print('Print file directory: ')
dir = gets.chomp
if File.exist? File.expand_path(dir)
  d = DateTime.now
  format = d.year.to_s + d.month.to_s + d.day.to_s + d.hour.to_s + d.minute.to_s + d.second.to_s
  FileUtils.cp(File.expand_path(dir), Dir.pwd + '/' + format + File.basename(dir))
else
  puts 'No such file or dir'
end