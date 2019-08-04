File.write('data.txt','') if !File.file?('data.txt')

while true
    puts 'Enter some text for file (or type \'exit\' to leave program)'
    text_new = gets.chomp
    return if text_new == 'exit'
    text_old = File.read('data.txt')
    File.write('data.txt', "#{text_old+text_new}\n#{Time.now.to_s[0..-7]}\n\n\n")
end
