require_relative 'encode.rb'

i=8
while i >= 4
  if i == 5
    $start_position = 125-(i*7) #4 blue
  else
    $start_position = 112+(i*8) #4 shifted, 5 blue
  end

  encode($input_img_search_path, $input_text_search_path, i, "output#{i}.bmp")
  i -=  1
end
