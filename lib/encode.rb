require_relative 'variables'
require_relative 'functions'

def encode()
  img_hex_str = img_to_hex($input_img_search_path)
  img_bin_arr = hex_to_bin(img_hex_str)

  if $input_via_file
    txt_str = txt_file_to_txt_str($input_text_search_path)
  else
    txt_str = $input_text
  end
  txt_bin = txt_to_bin(txt_str)

  bin_str = hider(txt_bin, img_bin_arr, $aggression)
  hex_str = bin_to_hex(bin_str)
  hex_to_img(hex_str, $output_img_search_path)
end

encode()
