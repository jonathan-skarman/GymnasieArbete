#Str to bin
def str_to_bin(str)
	p "string to bin"
	arr = str.bytes
	arr.each_index {|index| arr[index] = "0" + (arr[index].to_i).to_s(2)}
	str = ""
	arr.each {|el| str += el}
	str
end

#Hex to bin
#"\xff\x00".unpack("b*") # => ["1111111100000000"]
def hex_to_bin(hex_str)
	p "hex to bin"
	bin_arr_str = hex_str.unpack("b*") #gives an array with only one string
	bin_arr = []
	i = 0
	k = 0
	while i < bin_arr_str[0].length
		j = 0
		temp = ""
		while j < 8
			temp += bin_arr_str[0][i]
			j += 1
			i += 1
		end
		bin_arr << temp
		k += 1
	end
	return bin_arr
end

#Bin to hex
#['11111111' + '00000000'].pack('b*') # => "\xFF\x00"
def bin_to_hex(bin_arr)
	p "bin to hex"
	p "tar lång tid"
	bin_str = [""]
	#bin_str[0] = bin_arr.join
	bin_arr.each {|bin_number| bin_str[0] += bin_number} #Denna tar lång tid
	p "packing"
	hex_str = bin_str.pack("b*")
end

def hex_to_img_formater(hex_str_input)
	p "hex formater"
	hex_str_output = ""
	hex_str_output = hex_str_input
end

#Hex to img
def hex_to_img(hex_str, search_path)
	p "writing"
	write = File.open(search_path, 'w')
	write.puts(hex_str)
	write.close
end

#Img to hex
def img_to_hex(search_path)
	read = File.read(search_path)
end

#str_bin is the string to be hidden in the image
#img_bin_arr is the binare data of the image, with each bit in an array
#aggression is an integer between 1 and 8, that decides how many bits to change in each byte
def hider(str_bin, img_bin_arr, aggression)
	p "hider"
	#kolla om sträng får plats här!

	#i = 0
	#img_bin_arr.each {|byte| byte[7] = str_bin[i]; i+=1}


	#str_bin = "1010"
	i = 40
	j = 0
	while i < img_bin_arr.length && str_bin[j] != nil
		img_bin_arr[i][0] = str_bin[j]
		i += 1
		j += 1
	end
	img_bin_arr
end

def main(text_str, input_search_path, aggression, output_search_path)
	hex_to_img(hex_to_img_formater(bin_to_hex(hider(str_to_bin(text_str), hex_to_bin(img_to_hex(input_search_path)), aggression))), output_search_path)
	p "Exited successfully"
end

#puts "hej"
start = Time.now

main("Jag heter Bamse och gillar dunderhonung", "Images/test3.bmp", 8, "Images/hider.bmp")#Agg(1-8)

ending = Time.now

puts ending - start
