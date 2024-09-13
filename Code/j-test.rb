def str_to_bin(str)
  arr = str.bytes
  arr.each_index {|index| arr[index] = arr[index].to_s(2)}
  arr
end

def bin_to_str(arr)
  arr2 = []
  arr.each {|el| arr2 << el.to_i}
  #arr2.pack('c*')
end

#p str_to_bin("Hello World")
#p bin_to_str(["1001000", "1100101", "1101100", "1101100", "1101111", "100000", "1010111", "1101111", "1110010", "1101100", "1100100"])
#p 2**8

#p "hello world".unpack()
#p "hello world".bytes.pack('c*')
#p "H".bytes
p [72].pack('c*')

# .pack('c*')    decimal to str
