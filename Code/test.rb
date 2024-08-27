#"b abc".each_byte {|x| puts x.to_s(24)}
#makes string into hex byte


#"4218414243".each_byte {|x| puts x.to_s(24)}


bin = File.read("test3.bmp")
hex = bin.unpack("H*").first
puts hex
#reads image file and prints in terminal as hex

i = 0
hex_array = []
hex_array[0] = hex
p hex_array

puts "Converting back now"

p back_bin = hex_array.pack('H*')
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