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
	#k = 0
	while i < bin_arr_str[0].length
		j = 0
		temp = ""
		while j < 8
			temp += bin_arr_str[0][i]
			j += 1
			i += 1
		end
		bin_arr << temp
		#k += 1
	end
	#p bin_arr[0..240]
    #sleep(5)
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

def size_verifier(txt_bin, img_bin_arr, aggression)
	p "verifier"

	if ((img_bin_arr.length - $start_position) * aggression) < txt_bin.length
		raise "fml AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHhh"
	end

	true
end

#str_bin is the string to be hidden in the image
#img_bin_arr is the binare data of the image, with each bit in an array
#aggression is an integer between 1 and 8, that decides how many bits to change in each byte
def hider(txt_bin, img_bin_arr, aggression)
	p "hider"
	txt_bin += $break_line

	size_verifier(txt_bin, img_bin_arr, aggression)

	i = $start_position
	j = 0
	while i < img_bin_arr.length && txt_bin[j+(aggression-1)] != nil
		img_bin_arr[i][(0..(aggression-1))] = txt_bin[(j..(j+(aggression-1)))]
		i += 1
		j += aggression
	end

	if j < txt_bin.length
		num = txt_bin.length - j
		img_bin_arr[i][(0..(num-1))] = txt_bin[(j..(j+num-1))]
	end

	img_bin_arr
end

def searcher(bin_arr, start_position, aggression)
	puts "Searching"

	i = start_position
	str_temp = ""

	j = 0
	str_temp_2 = ""

	arr_temp = []


	while i < bin_arr.length
		str_temp += bin_arr[i][(0..(aggression-1))]
		i += 1
		#p str_temp.length

		#todo: fixa så den fungerar med alla aggression
		while j < str_temp.length
			str_temp_2 += str_temp[j]

			if str_temp_2.length % 8 == 0
				arr_temp.append(str_temp_2)
				#p arr_temp[arr_temp.length - 1]
				if is_breakline(str_temp_2)
					return arr_temp.join
				end
				str_temp_2 = ""
			end

			j += 1
		end
	end

	return arr_temp.join
end

def is_breakline(bin_str)
	bin_str == $break_line
end

#inga mellanslag i text_str, eller konstiga tecken, eller åäö
def main_hider(text_str, input_img_search_path, aggression, output_img_search_path)
	hex_to_img(hex_to_img_formater(bin_to_hex(hider(txt_to_bin(text_str), hex_to_bin(img_to_hex(input_img_search_path)), aggression))), output_img_search_path)
	p "Exited successfully"
end

def main_decoder(img_search_path)
	bin_to_txt(searcher(hex_to_bin(img_to_hex(img_search_path))))
end

$start_position = 70
$input_img_search_path = "kolakakor3.bmp"
$input_text = "dumheterdumdumdumfanfandavidsatandjaveldealerbuckshotdumheterdumdumdumfanfandavidsatandjaveldealerbuckshot"
$output_img_search_path = "test.bmp"
$aggression = 8
$break_line = "01111111"

#33 made not functioning img from smile.bmp
#32 made not functioning img from smiley.bmp

#$input_img_search_path = "Images/Skärmklipp.bmp"



start = Time.now

main_hider($input_text, $input_img_search_path, $aggression, $output_img_search_path)#Agg(1-8)

mid_point = Time.now

p main_decoder($output_img_search_path)

ending = Time.now

puts "Skriva"
puts mid_point - start

puts "Läsa"
puts ending - mid_point

#4k:
#2:30 min för skriva
#3:10 min för läsa

#ner från 1080p tog c.a 1h
