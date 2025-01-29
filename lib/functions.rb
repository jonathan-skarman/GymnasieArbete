#txt_str to bin_str
def txt_to_bin(str)
	p "string to bin"
	arr = str.bytes
	arr.each_index {|index| arr[index] = (arr[index].to_i).to_s(2).rjust(8, '0')}
	str = ""
	arr.each {|el| str += el}
	str
end

#hex_str to bin_arr
def hex_to_bin(hex_str)
	p "hex to bin"
	bin_arr_str = hex_str.unpack("b*") #gives an array with only one string
	bin_arr = []
	i = 0
	while i < bin_arr_str[0].length
		j = 0
		temp = ""
		while j < 8
			temp += bin_arr_str[0][i]
			j += 1
			i += 1
		end
		bin_arr << temp
	end
	return bin_arr
end

#bin_arr to hex_str
def bin_to_hex(bin_arr)
	p "bin to hex"
	bin_str = [""]
	bin_str[0] = bin_arr.join
	p "packing"
	hex_str = bin_str.pack("b*")
end

#hex_str to img
def hex_to_img(hex_str, search_path)
	p "writing"
	write = File.open(search_path, 'w')
	write.puts(hex_str)
	write.close
end

#Img to hex_str
def img_to_hex(search_path)
	p "img to hex"
	read = File.read(search_path)
end

def bin_arr_to_bin_str(bin_arr)
	p "bin_arr to bin_str"
	bin_str = bin_arr.join
end

#Bin_str to text_str
def bin_arr_to_txt(bin_arr)
	p "bin to txt"
	s = bin_arr
	output = ""
	(0..s.length-8).step(8) do |i|
		output += s[i,8].to_i(base=2).chr
	end
	return output
end

#verifies that the image is big enough to hide the text at the given aggression
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

#searches for the hidden text in the image
def searcher(bin_arr, start_position, aggression)
	p "Searching"

	i = start_position
	str_temp = ""

	j = 0
	str_temp_2 = ""

	arr_temp = []


	while i < bin_arr.length
		str_temp += bin_arr[i][(0..(aggression-1))]
		i += 1
		while j < str_temp.length
			str_temp_2 += str_temp[j]

			if str_temp_2.length % 8 == 0
				arr_temp.append(str_temp_2)
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

#checks if the string is the breakline character
def is_breakline(bin_str)
	bin_str == $break_line
end



def txt_file_to_txt_str(input_search_path)
	p "txt_file to txt_str"
  read = File.read(input_search_path)
end

def txt_str_to_txt_file(txt_str, output_search_path)
	p "txt_str to txt_file"
  write = File.open(output_search_path, 'w')
  write.puts(txt_str)
  write.close
end

def remove_breakline(txt_str, break_line)
	p "removing breakline"
	txt_str = txt_str.gsub(break_line, "")
end
