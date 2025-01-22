#These 2 can be changed, but don't change without understanding
$start_position = 120
$break_line = "01111111"



#How many bits in each byte are changed
$aggression = 7



#variables for encoding
#relative search path to the original image file
$input_img_search_path = "input.bmp"
#wether the input text will be the string below or from the file
$input_via_file = false
#textstring that will be encoded
$input_text = "exampleString"
#relative search path to an input text file
$input_text_search_path = "input.txt"



#variables for decoding
#relative search path the output image will get, creates new file if one doesn't exist
$output_img_search_path = "output.bmp"
#relative search path to the output text file
$output_text_search_path = "output.txt"
