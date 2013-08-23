watch('resume/.*\.md') do |file|
  cmd = %(./generate -f #{file})
  puts "'#{cmd}' -> " + `#{cmd}`
end


