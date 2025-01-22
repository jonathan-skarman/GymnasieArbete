require_relative 'variables'
require_relative 'functions'

def encode(input_search_path, txt_str, aggression, output_search_path)
  img_hex_str = img_to_hex(input_search_path)
  img_bin_arr = hex_to_bin(img_hex_str)

  txt_bin = txt_to_bin(txt_str)

  bin_str = hider(txt_bin, img_bin_arr, aggression)
  hex_str = bin_to_hex(bin_str)
  hex_to_img(hex_str, output_search_path)
end



def decode(img_search_path, start_position, aggression)
  img_hex = img_to_hex(img_search_path)
  img_bin = hex_to_bin(img_hex)
  txt_bin = searcher(img_bin, start_position, aggression)
  txt = bin_arr_to_txt(txt_bin)
  return txt
end



encode($input_img_search_path, $input_text, $aggression, $output_img_search_path)
decode($output_img_search_path, $start_position, $aggression)
