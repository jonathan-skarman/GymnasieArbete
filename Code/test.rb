#"b abc".each_byte {|x| puts x.to_s(24)}
#makes string into hex byte


#"4218414243".each_byte {|x| puts x.to_s(24)}


bin = File.read("sixteenbit.bmp")
hex = bin.unpack("H*").first
#puts hex
#reads image file and prints in terminal as hex
puts "Hex längden"
puts hex.length
i = 0
hex_array = []
hex_array[0] = hex
#p hex_array

puts "Converting back now"

back_bin = hex_array.pack('H*')
p back_bin

bamse = File.open('writing.bmp', 'w')
#encode before writing to file
bamse.puts(back_bin)
bamse.close


#Unused code for now

=begin
while i < hex.length
  temp_sring = ""
  temp_sring << hex[i]
  temp_sring << hex[i + 1]
  hex_array << temp_sring
  i += 2
end
p hex_array
=end


def bin_to_hex(bin_arr)
	bin_str = [""]
	bin_arr.each {|bin_number| bin_str[0] += bin_number} #Denna tar lång tid
	hex_str = bin_str.pack("b*")
end
