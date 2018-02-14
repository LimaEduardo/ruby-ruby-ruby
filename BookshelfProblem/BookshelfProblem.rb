fileName = ARGV[0]
if File.file?(fileName)
  file = File.new(fileName, "r")
  firstLine = true
  numberOfBooks = Array.new
  while (line = file.gets)
    if firstLine
      shelfsAvailable = line.split(" ").map(&:to_i)
      firstLine = false
    else
      numberOfBooks.push(Integer(line.split(" ")[0]))
    end
  end
  file.close
  numberOfBooks = numberOfBooks.inject{|sum,x| sum + x};
  if (shelfsAvailable.inject{ |sum,x| sum + x} < numberOfBooks)
    puts "It's impossible"
  else
    shelfsAvailable = shelfsAvailable.sort{ |x,y| y <=> x}
    shelfsNeedeed = [0]
    shelfsAvailable.each do |shelf|
      if (shelfsNeedeed.inject{ |sum,x| sum + x} + shelf < numberOfBooks)
        shelfsNeedeed.push(shelf)
      else
        shelfsNeedeed.push(shelf)
        break
      end
    end
    puts shelfsNeedeed.length - 1
  end
else
  puts "The file #{fileName} don't exist"
end
