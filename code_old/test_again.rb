def txt_to_bin(str)
	p "string to bin"
	arr = str.bytes
	arr.each_index {|index| arr[index] = (arr[index].to_i).to_s(2).rjust(8, '0')}
	str = ""
	arr.each {|el| str += el}
	str
end

#missar en 0a vid " "

def str_to_arr(str)
  arr = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
  i = 0
  while i < str.length
    arr[(i/8).floor] << str[i]
    i += 1
  end
  arr
end

def bin_arr_to_txt(bin_arr)
	s = bin_arr
	output = ""
	(0..s.length-8).step(8) do |i|
		output += s[i,8].to_i(base=2).chr
	end
	return output
end


p ((txt_to_bin("text example")))
p bin_arr_to_txt((txt_to_bin("text example")))
