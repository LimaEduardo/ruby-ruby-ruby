initialArray = gets.chomp.split("")
charChecked = []
initialArray.each do | c |
	if (charChecked.include? c)
		print c
		charChecked.each_with_index do |l,i|
			if (l == c)
				puts " / #{i}"
			end
		end
		break
	else
		charChecked.push(c)
	end
end
