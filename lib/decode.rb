require_relative 'variables'
require_relative 'functions'

def decode(img_search_path, start_position, aggression, output_text_search_path, break_line)
  img_hex = img_to_hex(img_search_path)
  img_bin = hex_to_bin(img_hex)
  txt_bin = searcher(img_bin, start_position, aggression)
  txt_bin = remove_breakline(txt_bin, break_line)
  txt_str = bin_arr_to_txt(txt_bin)
  txt_str_to_txt_file(txt_str, output_text_search_path)
end

decode($output_img_search_path, $start_position, $aggression, $output_text_search_path, $break_line)
