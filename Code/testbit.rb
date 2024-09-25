bin = File.read("test3.bmp")
hex = bin.unpack("H*").first
p hex
#saker = "hello"
saker = ""
saker = hex[0]
#saker << hex[1]
p saker
saker = saker.bytes
p "hello"
p saker
binary = saker[0].to_s(2)
p binary

binary[4] = "1"
p binary
binary_array = []
binary_array << binary
saker = binary_array.pack('B*')
p saker
saker = saker[0][2].to_s
p saker


=begin
saker = binary.bytes
p saker


i = (binary.length-1)
k = 0
back_array = [0]
while i >= 0
    if binary[i] == "1"
        back_array[0] += (2**k)
    end
    i -= 1
    k += 1
end

p back_array
back_array[0] = back_array[0].to_s
p saker = back_array[0].pack('c*')
p "nerpackat"
p saker
puts "hex code "
p hex
=end