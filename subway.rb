def whichLine(input)
  n_line = ["Times Square", "34th St.", "28th St.", "23rd St.", "Union Square", "8th St."]
  l_line = ["8th ave.", "6th ave.", "Union Square", "3rd ave.", "1st ave."]
  six_line = ["Grand Central", "33rd St.", "28th St.", "23rd St.", "Union Square", "Astor Place"]
  case input
  when "n"
    n_line
  when "l"
    l_line
  when "6"
    six_line
  end
end

def validate_line_input(line_input, options)
  while !options.include? line_input
    puts "Enter valid option: N, L or 6"
    line_input = gets.chomp.downcase
  end
  return line_input
end

def stationLister(subway_line)
  counter = 0
  subway_line.each { |x| puts "#{counter+=1}) #{x} " }
end

def stationSelector(subway_line, subway_station_number)
  subway_station = nil

  while subway_station == nil

    if subway_line == 'n'


      case subway_station_number
      when 1
        subway_station = "Times Square"
      when 2
        subway_station = "34th St."
      when 3
        subway_station = "28th St."
      when 4
        subway_station = "23rd St."
      when 5
        subway_station = "Union Square"
      when 6
        subway_station = "8th St."
      else
        puts 'please enter a valid station'
        subway_station_number = gets.chomp.to_i
      end

    elsif subway_line == 'l'
      case subway_station_number
      when 1
        subway_station = "8th ave."
      when 2
        subway_station = "6th ave."
      when 3
        subway_station = "Union Square"
      when 4
        subway_station = "3rd ave."
      when 5
        subway_station = "1st ave."
      else
        puts 'please enter a valid station'
        subway_station_number = gets.chomp.to_i
      end
    else
      case subway_station_number
      when 1
        subway_station = "Grand Central"
      when 2
        subway_station = "33rd St."
      when 3
        subway_station = "28th St."
      when 4
        subway_station = "23rd St."
      when 5
        subway_station = "Union Square"
      when 6
        subway_station = "Astor Place"
      else
        puts 'please enter a valid station'
        subway_station_number = gets.chomp.to_i
      end
    end
  end
  subway_station
end


puts "What is the starting line: N, L or 6?"
start_line_input = gets.chomp.downcase
start_line_input = validate_line_input(start_line_input,["n","l","6"])
start_line = whichLine(start_line_input)

puts "Please choose a starting station: "
stationLister(start_line)
subway_station_input = gets.chomp.to_i
start_station = stationSelector(start_line_input,subway_station_input)


puts "What is the ending line: N, L or 6?"
end_line_input = gets.chomp.downcase
end_line_input = validate_line_input(end_line_input,["n","l","6"])
end_line = whichLine(end_line_input)

puts "Please choose the ending station:"
stationLister(end_line)
end_station_input = gets.chomp.to_i
end_station = stationSelector(end_line_input, end_station_input)

starting_point = (start_line).index(start_station)
destination = (end_line).index(end_station)
same_neutral = (start_line).index("Union Square")
end_neutral = (end_line).index("Union Square")

if start_line == end_line
  single_line_trip = (starting_point - destination).abs
  puts "Your trip will take #{single_line_trip} stops"
else
  multi_line_trip = (starting_point - same_neutral).abs + (end_neutral - destination).abs
  puts puts "Your trip will take #{multi_line_trip} stops"
end
