# frozen_string_literal: true

def dfa(input)
  state = 'q0'
  
  input.each_char do |char|
    case state
    when 'q0'
      case char
      when '0'..'9'
        state = 'q3'
      when '('
        state = 'q1'
      else
        state = 'hata'
      end
    when 'q1'
      case char
      when '0'..'9'
        state = 'q2'
      else
        state = 'hata'
      end
    when 'q2'
      case char
      when '+', '-', '*', '/'
        state = 'q1'
      when '0'..'9'
        state = 'q2'
      when ','
        state = 'q2'
      when ')'
        state = 'q3'
      else
        state = 'hata'
      end
    when 'q3'
      case char
      when '+', '-', '*', '/'
        state = 'q0'
      when '0'..'9'
        state = 'q3'
      when ','
        state = 'q3'
      else
        state = 'hata'
      end
    when 'hata'
      break
    end
  end
  
  return state == 'q3'
end

puts 'İşlem Giriniz:'
girdi = gets.chomp
girdi = girdi.gsub(/\s/, "")
if dfa(girdi)
  puts "Doğru sözdizimi"
else
  puts "Yanlış sözdizimi"
end

