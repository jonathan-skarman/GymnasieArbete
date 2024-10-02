#Str to bin
def str_to_bin(str)
	arr = str.bytes
	arr.each_index {|index| arr[index] = "0" + (arr[index].to_i).to_s(2)}
	arr
end

#Hex to bin
#"\xff\x00".unpack("b*") # => ["1111111100000000"]
def hex_to_bin(hex_str)
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
	bin_str = [""]
puts "bamse"
	p bin_str
	p bin_arr
	bin_arr.each {|bin_number| bin_str += bin_number; p bin_str; p bin_number}
	hex_str = bin_str.pack("b*")
end

#Hex to img
def hex_to_img(hex_str, search_path)
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
	i = 0

	img_bin_arr.each do |byte|
 		byte[7] = str_bin[i]
 		i += 1
 		p i
	end
end

def main(text_str, input_search_path, aggression, output_search_path)
	hex_to_img(bin_to_hex(hider(str_to_bin(text_str), hex_to_bin(img_to_hex(input_search_path)), aggression)), output_search_path)
	p "test"
end

#puts "hej"

main("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "test3.bmp", 8, "hider.bmp")#Agg(1-8)
