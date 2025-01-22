require_relative 'functions'
require_relative 'variables'

txt_str = txt_file_to_txt_str($input_text_search_path)

p txt_str

txt_str_to_txt_file(txt_str, $output_text_search_path)
