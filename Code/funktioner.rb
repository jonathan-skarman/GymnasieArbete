#Bästa dokumentationen någonsin
#https://docs.ruby-lang.org/en/master/packed_data_rdoc.html#label-Hex+String+Directives 

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

	#untested
	bin_arr = []
	i = 0
	k = 0
	while i < bin_arr_str[0].length
		j = 0
		while j < 8
			bin_arr[k] += bin_arr_str[0][i]
			j += 1
			i += 1
		end
		k += 1
	end
end

#Bin to hex
#['11111111' + '00000000'].pack('b*') # => "\xFF\x00"
def bin_to_hex(bin_arr)
	bin_str = [""]
	bin_arr.each do {|bin_number| bin_str[0] += bin_number}
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
#img_bin is the binare data of the image
#aggression is an integer between 1 and 8, that decides how many bits to change in each byte
def hider(str_bin, img_bin, aggression)
end

def main(text_str, img_search_path, aggression)
	hex_to_img(bin_to_hex(hider(str_to_bin, hex_to_bin(img_to_hex(img_search_path)), aggression)))
end







#p hex_to_bin("HEASFS")
#p str_to_bin("FF")

#Test skrivning av läsa in och skriva (FUNKAR)
=begin
p bin = File.read("code/test3.bmp")

p bin_to_hex(hex_to_bin(bin))
saker = File.open("code/saker.bmp", 'w')
	saker.puts(bin_to_hex(hex_to_bin(bin)))
p img_to_hex("code/test3.bmp")
=end
