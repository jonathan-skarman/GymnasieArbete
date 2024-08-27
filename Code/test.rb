#"b abc".each_byte {|x| puts x.to_s(24)}
#makes string into hex byte


#"4218414243".each_byte {|x| puts x.to_s(24)}


bin = File.read("test3.bmp")
hex = bin.unpack("H*").first
puts hex
