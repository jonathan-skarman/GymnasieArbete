#txt_str to bin_str
def txt_to_bin(str)
	p "string to bin"
	arr = str.bytes
	arr.each_index {|index| arr[index] = "0" + (arr[index].to_i).to_s(2)}
	str = ""
	arr.each {|el| str += el}
	str
end

#hex_str to bin_arr
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

#bin_arr to hex_str
#['11111111' + '00000000'].pack('b*') # => "\xFF\x00"
def bin_to_hex(bin_arr)
	p "bin to hex"
	bin_str = [""]
	bin_str[0] = bin_arr.join
	p "packing"
	hex_str = bin_str.pack("b*")
end

#hex_str formatter for packing to img
def hex_to_img_formater(hex_str_input)
	p "hex formater"
	hex_str_output = ""
	hex_str_output = hex_str_input
end

#formated hex_str to img
def hex_to_img(hex_str, search_path)
	p "writing"
	write = File.open(search_path, 'w')
	write.puts(hex_str)
	write.close
end

#Img to hex_str
def img_to_hex(search_path)
	read = File.read(search_path)
end

def bin_arr_to_bin_str(bin_arr)
	bin_str = bin_arr.join
end

#Bin_str to text_str
def bin_to_txt(bin_arr)
	s = bin_arr

	#p bin_str

	#s = "10110010"#01011010000000000000000000000000000000000000000000000000000000000110110000000000000000000000000000010100000000000000000000000000110000000000000000000000000000001100000000000000000000000000000010000000000000000001100000000000000000000000000000000000000000000010010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111001100101000110101000100011111110111111101111111111111111111111111111111001001000011100010110111111111111111111111111111000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111000000000000000000000000"
	#s = "010011010101010101011010"
	(0..s.length-8).step(8) do |i|
		print s[i,8].to_i(base=2).chr
	end
	puts
end

#str_bin is the string to be hidden in the image
#img_bin_arr is the binare data of the image, with each bit in an array
#aggression is an integer between 1 and 8, that decides how many bits to change in each byte
def hider(txt_bin, img_bin_arr, aggression)
	p "hider"
	#kolla om sträng får plats här!

	i = 40
	j = 0
	while i < img_bin_arr.length && txt_bin[j] != nil
		img_bin_arr[i][3] = txt_bin[j]
		#0 is cyan pixels
		#1 is magenta
		#2 is yellow
		#3 is gray
		#then it repeats
		i += 1
		j += 1
	end
	img_bin_arr
end

def searcher(bin_arr)
	i = 40
	str = ""

	while i < bin_arr.length
		str += bin_arr[i][3]
		i += 1
	end

	str
end

#inga mellanslag i text_str, eller konstiga tecken, eller åäö
def main_hider(text_str, input_img_search_path, aggression, output_img_search_path)
	hex_to_img(hex_to_img_formater(bin_to_hex(hider(txt_to_bin(text_str), hex_to_bin(img_to_hex(input_img_search_path)), aggression))), output_img_search_path)
	p "Exited successfully"
end

def main_decoder(img_search_path)
	bin_to_txt(searcher(hex_to_bin(img_to_hex(img_search_path))))
end



start = Time.now

main_hider("HejaBamseVarldensBastaBamse", "Images/smile.bmp", 8, "Images/test.bmp")#Agg(1-8)
p main_decoder("Images/test.bmp")

#bin_to_txt(txt_to_bin("ABCDEFGHIJKLMNOPQRSTUVWXYZ"))

ending = Time.now

puts ending - start
